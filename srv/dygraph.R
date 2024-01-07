
output$hydgrph <- renderDygraph({
  if (!is.null(input$map_marker_click)){
    e <- input$map_marker_click
    station$id <- e$id
    if (!is.null(station$id)) {
      
      station$tbl <- realtime_dd(station_number = station$id)
      station$info <- loc %>% filter(STATION_NUMBER==station$id)
      
      station$tbl %>%
        filter(Parameter=='Flow') %>%
        mutate(Flow=Value) %>%
        subset(select=c(Date,Flow)) %>%
        dygraph()
    }
  }
})