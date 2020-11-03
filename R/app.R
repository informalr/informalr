#' Shiny App
#'
#' @examples
#' run_app()
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
        shiny::titlePanel("Hiking guide"),
        shiny::imageOutput("map")
    )

    # Define server logic required to draw a histogram
    server <- function(input, output) {
      output$map <- renderPlot({
        png_filename <- tempfile(fileext = ".png")
        informalr::create_map(png_filename)
        png(png_filename)
      })
    }
    shiny::shinyApp(ui = ui, server = server)
}
