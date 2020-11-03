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
    ui <- shiny::fluidPage(

        # Application title
        shiny::titlePanel("Hiking guide")
    )

    # Define server logic required to draw a histogram
    server <- function(input, output) {
    }
    shiny::shinyApp(ui = ui, server = server)
}
