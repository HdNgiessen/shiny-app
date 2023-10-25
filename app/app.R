# Load the required libraries
library(shiny)
library(leaflet)


# Define the UI
ui <- fluidPage(
  titlePanel("Brandenburg Gate Map"),
  leafletOutput("brandenburg_map")
)

# Define the server
server <- function(input, output, session) {
  
  output$brandenburg_map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%  # Add a default tile layer
      addMarkers(
        lng = 13.377704,
        lat = 52.516275,
        popup = "Brandenburg Gate"
      )
  })
}

# Run the Shiny app
shinyApp(ui, server)


# deploy app with shiny live
# setwd("~/Insync/thhaase.soz@gmail.com/GoogleDrive/_1_Projects/T14 Haus der Nachhaltigkeit 2/shiny app")
# library(shinylive)
# shinylive::export(appdir = "app", destdir = "docs")
