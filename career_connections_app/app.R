library(tidyverse)
library(shiny)
library(openxlsx)
library(DT)


# Read data
  # should be changed to reading data from Jeffry's Google Sheets directly 
  # using the package 'googlesheets4' (see /analysis/Career_opportunities.Rmd)
career_connections <-"/cloud/project/data/Career_Connections_Database.xlsx"

# Combine data sheets
sheets <- openxlsx::getSheetNames(career_connections)

SheetList <- lapply(sheets, openxlsx::read.xlsx, xlsxFile=career_connections)

names(SheetList) <- sheets

CombinedCareerConnections_shiny <- data.table::rbindlist(SheetList, 
                                                         fill = TRUE, 
                                                         idcol = "SheetName")

## create column that takes the names of the sheets and applies them to each row of that original sheet
CombinedCareerConnections_shiny$Opportunity <- rep(sheets, sapply(SheetList, nrow))

## create a column that turns characters in Application_Due column into dates
CombinedCareerConnections_shiny <- CombinedCareerConnections_shiny %>%
  mutate(Deadline = case_when(
    !is.na(as.numeric(Application_Due)) ~ as.Date(as.numeric(Application_Due), origin = "1899-12-30"),
    Application_Due %in% c("Rolling Basis", "ASAP") ~ Sys.Date(), #today
    TRUE ~ as.Date(Application_Due, format = "%b %d")
  )) %>%
  mutate(Deadline = case_when(
    Application_Due %in% c("Contact for info", "Unknown") ~ 
      max(Deadline, na.rm = TRUE) + 1, # maximum date in dataset plus one day
    TRUE ~ Deadline
  ))

# User Interface
ui = fluidPage(
  
  titlePanel("COA Career Connections"),
## Sidebar Panel ----
  sidebarLayout(
    
    sidebarPanel = sidebarPanel(
      
  # vector: Organization   
      textInput("text_org", label = h3("Organization"), value = ""),
      
  # vector: Position(s)
      textInput("text_pos", label = h3("Position/Title"), value = ""),
      
  # vector: Pay - Unpaid Career Connections
      radioButtons("exclude_unpaid", label = h3("Unpaid Career Connections"),
                   choices = c("Exclude", "Include"),
                   selected = "Include"
                ),
      
  # vector: International Students    
      radioButtons("Open_to_Intl._Students", label = h3("Are you an international student?"), 
                     choices = c("Yes", "No"),
                     selected = "Yes"),
  
  # vector: Opportunity
      checkboxGroupInput("OpportunityType", label = h3("Type of Opportunity"), 
                         choices = unique(CombinedCareerConnections_shiny$Opportunity),
                         selected = unique(CombinedCareerConnections_shiny$Opportunity),
                         )
    ),
  
## Main Panel ----    
    mainPanel = mainPanel(
      
      dataTableOutput(outputId = 'data_table')
    )
  )
)

server = function(input, output){
  
  output$data_table = renderDataTable({
    filtered_data <- CombinedCareerConnections_shiny
    
    # Filter data based on Organization Text Input
    search_terms_org <- strsplit(input$text_org, "\\s+")[[1]]
    
    filtered_data <- filter(filtered_data, 
                            grepl(paste(search_terms_org, collapse = "|"), 
                                  tolower(Organization), 
                                  ignore.case = TRUE))
    
    # Filter data based on Position(s) Text Input
    search_terms_pos <- strsplit(input$text_pos, "\\s+")[[1]]
    
    filtered_data <- filter(filtered_data, 
                            grepl(paste(search_terms_pos, collapse = "|"), 
                                  tolower(`Position(s)`), 
                                  ignore.case = TRUE))
    
    # Filter data based on Unpaid radioButton
    if (input$exclude_unpaid == "Exclude") { 
      filtered_data <- subset(filtered_data != "Unpaid")} 
    else if (input$exclude_unpaid == "Include") { }
    
    # Filter data based on International Students radioButtons
    if (input$Open_to_Intl._Students == "Yes") {
      filtered_data <- subset(filtered_data, 
                              `Open_to_Intl._Students` == "Yes" | 
                                is.na(`Open_to_Intl._Students`))
    } else if (input$Open_to_Intl._Students == "No") {
      filtered_data <- subset(filtered_data, 
                              `Open_to_Intl._Students` == "No" | 
                                is.na(`Open_to_Intl._Students`))
    }
    
    # Filter data based on Opportunity checkbox
    filtered_data <- filtered_data[
      filtered_data$Opportunity %in% input$OpportunityType, ]
    
    # Automatic ordering based on Deadline dates
    filtered_data <- filtered_data[order(filtered_data$Deadline), ]
    
    # Datatable basis
    datatable(filtered_data, options = list(
      searching = FALSE, 
      pageLength = 5,
      lengthMenu = c(5, 15, 20, 25), 
      columnDefs = list(
        list(visible = FALSE, targets = c(1, 7)), 
 #the following line of code does not work but it is the column order I propose
        list(targets = c(11, 2, 3, 5, 8, 12, 10, 6, 9)) 
        )
      )
    )
  })
}

shinyApp(ui, server)
