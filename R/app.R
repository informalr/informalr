#' Shiny App
#'
#' @author Claudio Tiecher
#' @export
#
# This is a Shiny web application.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Run the application
run_app <- function() {
  # Define UI for application that draws a histogram
  ui <- fluidPage(plotOutput("map"))

  server <- function(input, output) {
    output$map <- shiny::renderImage({
      filename <- "bike_app_stub.png"
      # Return a list containing the filename
      list(src = filename)
    }, deleteFile = FALSE)

  }
  shiny::shinyApp(ui = ui, server = server)
}
