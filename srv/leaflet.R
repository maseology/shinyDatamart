
output$map <- renderLeaflet({
  leaflet(loc) %>%
    addTiles() %>%
    
    addMarkers(
      layerId = ~STATION_NUMBER,
      lng = ~LONGITUDE,
      lat = ~LATITUDE,
      label = ~paste0(STATION_NUMBER,': ',STATION_NAME),
    )      
})