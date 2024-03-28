library(tidyverse)
library(shiny)
library(sf)
library(leaflet)
library(readxl)
library(DT)


Internships_shiny <- read_excel("Internship_Program.xlsx", 
                             col_types = c("text", "text", "numeric", 
                                           "text", "text", "text", "numeric", 
                                           "numeric", "text", "text"), na = c("NA", ""))
Internships_shiny <- Internships_shiny %>%
  filter(is.na(Year) == FALSE, Year != "NA") %>%
  separate_longer_delim(Year, delim = ", ") %>%
  select(!Name)


#UserInterface
ui = fluidPage(
  titlePanel("Past Internships by students at
             College of the Atlantic"),

# Main Panel ----
    mainPanel(
      sliderInput("Year", "Years", min = 1973, max = 2023, value = c(2000, 2023), sep = ""),
      
      tabsetPanel(
      tabPanel("Map", leafletOutput(outputId = 'map')),
      tabPanel("Table", dataTableOutput(outputId = 'table')))
    )
  )

#Server
server = function(input, output){
  map_df = reactive({
    filtered_years <- Internships_shiny %>%
      filter(Year >= input$Year[1] & Year <= input$Year[2]) %>%
      filter(!is.na(Longitude) & !is.na(Latitude)) %>%
      st_as_sf(coords = c("Longitude", "Latitude"), crs = 4326) %>%
      st_jitter(factor = 0.00001)
    
    labels <- lapply(1:nrow(filtered_years), function(i) {
      label <- sprintf("<strong>%s</strong><br/> %s<br/> %s<br/> %s",
                       filtered_years$`Internship Site`[i],
                       filtered_years$`Title (if applicable)`[i],
                       filtered_years$Location[i], 
                       filtered_years$Year[i]) %>%
        htmltools::HTML()
      return(label)
    })
    
    list(data = filtered_years, labels = labels)
  })
  
  output$map = renderLeaflet({
    
    leaflet() %>%
      addTiles() %>%
      setView(lng = -68.7, lat = 44.8, zoom = 5) %>%
      addCircleMarkers(data = map_df()$data, 
                       label = map_df()$labels,  
                       stroke = FALSE, 
                       fillOpacity = 0.5,
                       fillColor = map_df()$Year,
                       clusterOptions = markerClusterOptions())
  })
  
  output$table = renderDataTable({
    DT::datatable(Internships_shiny %>%
      filter(Year >= input$Year[1] & Year <= input$Year[2]), 
      options = list(columnDefs = list(
          list(visible = FALSE, targets = c(6, 7, 8, 9))))
      )
  })
}

shinyApp(ui, server)
