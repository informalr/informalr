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

# Shiny app should live in the proper folder and also be tested.
# For more info, look here:
# https://rstudio.github.io/shinytest/articles/shinytest.html
# For a specific example of Shiny app inside package, look here:
# https://rstudio.github.io/shinytest/articles/package.html
# Different options are available.

# Run the application
run_app <- function() {
  # Define UI for application that draws a histogram
  ui <- shiny::fluidPage(shiny::plotOutput("map"))

  server <- function(input, output) {
    output$map <- shiny::renderImage({
      filename <- "bike_app_stub.png"
      # Return a list containing the filename
      list(src = filename)
    }, deleteFile = FALSE)

  }
  shiny::shinyApp(ui = ui, server = server)
}
