station <- reactiveValues(id=NULL, tbl=NULL, info=NULL)

output$txtStaID <- renderText({ 
  if (!is.null(station$id)) {
    paste0(station$id, ': ', station$info$STATION_NAME)
  }  
})