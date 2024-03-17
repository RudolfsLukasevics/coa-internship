library(tidyverse)
library(shiny)
#install.packages("sf")
library(sf)
library(leaflet)
library(readxl)

#install.packages('rgdal', type = "source", configure.args=c('--with-proj-include=/panfs/roc/msisoft/proj/4.9.3/include','--with-proj-lib=/panfs/roc/msisoft/proj/4.9.3/lib'))
#install.packages('sf')


Internships_shiny <- read_excel("/cloud/project/internships_app/Internship_Program_Edit.xlsx", 
                             col_types = c("text", "text", "numeric", 
                                           "text", "text", "text", "numeric", 
                                           "numeric", "text", "text"), na = c("NA", ""))
Internships_shiny <- Internships_shiny %>%
  filter(Year %in% 1973:2023)

#UserInterface
ui = fluidPage(
  titlePanel("Mapping Past Internships"),
  
  sidebarLayout(
    sidebarPanel = sidebarPanel(
      sliderInput("Year", "Years", min = 1973, max = 2023, value = c(2000, 2023))
    ),
    mainPanel = mainPanel(
      leafletOutput(outputId = 'map')
    )
  )
)

#Server
server = function(input, output){
  map_df = reactive({
    Internships_shiny %>%
      filter(Year >= input$Year[1] & Year <= input$Year[2]) %>%
      filter(!is.na(Longitude) & !is.na(Latitude)) %>%
      st_as_sf(coords = c("Longitude", "Latitude"), crs = 4326)
  })

  output$map = renderLeaflet({
    
    leaflet() %>%
      addTiles() %>%
      setView(lng = -18.8, lat = 21.3, zoom = 1.2) %>%
      addMarkers(data = map_df())
    })
  }


shinyApp(ui, server)
