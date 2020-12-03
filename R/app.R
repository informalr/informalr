library(shiny)

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
  shiny::shinyApp(ui <- shiny::fluidPage('Hello world!'),
                  server <- function(input, output) {
                  })
}
