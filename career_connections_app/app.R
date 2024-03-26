library(tidyverse)
library(shiny)
library(openxlsx)
library(DT)


# Read data
career_connections <-"/cloud/project/data/Career_Connections_Database.xlsx"

# Combine data sheets
sheets <- openxlsx::getSheetNames(career_connections)

SheetList <- lapply(sheets,openxlsx::read.xlsx,xlsxFile=career_connections)

names(SheetList) <- sheets

CombinedCareerConnections <- data.table::rbindlist(SheetList, fill = TRUE)

CombinedCareerConnections$Opportunity <- rep(sheets, sapply(SheetList, nrow))

# User Interface
ui = fluidPage(
  
  titlePanel("COA Career Connections"),
# Sidebar Panel ----
  sidebarLayout(
    
    sidebarPanel = sidebarPanel(),
# Main Panel ----    
    mainPanel = mainPanel(
      
      dataTableOutput(outputId = 'datatable')
    )
  )
)

server = function(input, output){
  
  datatable = reactive({
  })
  
  output$table = renderDataTable({
    
  })
  
  
}

shinyApp(ui, server)
