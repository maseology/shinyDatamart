
library(dplyr)
library(shiny)
library(leaflet)
library(dygraphs)
library(tidyhydat)

loc <<- realtime_stations()

shinyApp(
  ui <- bootstrapPage(
    tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
    tags$head(includeCSS("assets/css/styles.css")),
    
    leafletOutput("map", width = "100%", height = "100%"),
    
    # modified from superZip (http://shiny.rstudio.com/gallery/superzip-example.html)
    absolutePanel(
      id = "panl", class = "panel panel-default", fixed = TRUE,
      draggable = FALSE, top = 10, left = "auto", right = 10, bottom = "auto",
      width = 430, height = "auto",

      h3("Hydrograph explorer"),
      div(textOutput("txtStaID")),
      dygraphOutput("hydgrph", height = 240), br(),
      div(style="display:inline-block",downloadButton('dnld', 'Download CSV'))
    )
  ),
  server <- function(input, output, session) {
    
    source("srv/reactives.R", local = TRUE)$value
    source("srv/leaflet.R", local = TRUE)$value
    source("srv/dygraph.R", local = TRUE)$value
    source("srv/download.R", local = TRUE)$value
    
    session$onSessionEnded(stopApp)
  }
)




