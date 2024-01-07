
output$dnld <- downloadHandler(
  filename <- function() { paste0(station$id, '.csv') },
  content <- function(file) {
    write.csv(station$tbl, file, row.names = FALSE)
  } 
)