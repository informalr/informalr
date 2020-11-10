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
        shiny::titlePanel("Hiking guide"),
        shiny::mainPanel(
          shiny::imageOutput("map", width = "400px", height = "400px")
        )
      )

    # Define server logic required to draw the PNG
    # Does not work :-(
    server <- function(input, output) {
      output$map <- shiny::renderPlot({
        png_filename <- tempfile(fileext = ".png")
        informalr::create_map(png_filename)
        grDevices::png(png_filename, width = 400, height = 400, type = "cairo")
      })
    }
    shiny::shinyApp(ui = ui, server = server)
}
