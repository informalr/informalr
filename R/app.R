#' Shiny App
#' @note
#' This is a Shiny web application.
#'
#' Find out more about building applications with Shiny here:
#'
#' http://shiny.rstudio.com/
#'
#' Shiny app should live in the proper folder and also be tested.
#' For more info, look here:
#' https://rstudio.github.io/shinytest/articles/shinytest.html
#' For a specific example of Shiny app inside package, look here:
#' https://rstudio.github.io/shinytest/articles/package.html
#' Different options are available.
#' In this specific case we chose to create our application object by function.
#'
#' @author Claudio Tiecher
#' @export

app <- function() {
  # Create shinyApp object with ui and server
  shiny::shinyApp(ui <- shiny::fluidPage(shiny::plotOutput("map")),
                  server <- function(input, output) {
                    output$map <- shiny::renderImage({
                      filename <- "bike_app_stub.png"
                      # Return a list containing the filename
                      list(src = filename)
                    }, deleteFile = FALSE)
                  })
}
