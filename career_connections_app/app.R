library(tidyverse)
library(shiny)
library(openxlsx)
library(DT)


# Read data
career_connections <-"/cloud/project/data/Career_Connections_Database.xlsx"

# Combine data sheets
sheets <- openxlsx::getSheetNames(career_connections)

SheetList <- lapply(sheets, openxlsx::read.xlsx, xlsxFile=career_connections)

names(SheetList) <- sheets

CombinedCareerConnections_shiny <- data.table::rbindlist(SheetList, fill = TRUE, idcol = "SheetName")

    # create vector/column that takes the names of the sheets and applies them to each row of that original sheet
CombinedCareerConnections_shiny$Opportunity <- rep(sheets, sapply(SheetList, nrow))


# User Interface
ui = fluidPage(
  
  titlePanel("COA Career Connections"),
# Sidebar Panel ----
  sidebarLayout(
    
    sidebarPanel = sidebarPanel(
  # vector: International Students    
      checkboxGroupInput("Open_to_Intl._Students", label = h3("International Students"), 
                         choices = list("Yes" = 1, "No" = 2),
                         selected = 1),
  # vector: Opportunity
      checkboxGroupInput("Opportunity", label = h3("Type of Opportunity"), 
                         choices = unique(CombinedCareerConnections_shiny$Opportunity),
                         selected = unique(CombinedCareerConnections_shiny$Opportunity),
                         )
    ),
  
# Main Panel ----    
    mainPanel = mainPanel(
      
      dataTableOutput(outputId = 'data_table')
    )
  )
)

server = function(input, output){
  
  output$data_table = renderDataTable({
    filtered_data <- CombinedCareerConnections_shiny
    
    # Filter data based on International Students checkbox
    if (input$Open_to_Intl._Students == 1) {
      filtered_data <- subset(filtered_data, `Open_to_Intl._Students` == "Yes" | is.na(`Open_to_Intl._Students`))
    } else if (input$Open_to_Intl._Students == 2) {
      filtered_data <- subset(filtered_data, `Open_to_Intl._Students` == "No" | is.na(`Open_to_Intl._Students`))
    }
    
    # Filter data based on Opportunity checkbox
    filtered_data <- CombinedCareerConnections_shiny[
      CombinedCareerConnections_shiny$Opportunity %in% input$Opportunity, ]
    
    datatable(filtered_data, options = list(
      searching = FALSE, 
      pageLength = 5,
      lengthMenu = c(5, 15, 20, 25)
    ))
  })
  
}

shinyApp(ui, server)
