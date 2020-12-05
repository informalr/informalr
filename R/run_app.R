#' Run the Shiny App
#'
#' @export
run_app <- function() {
  shiny::shinyApp(
    ui = shiny::fluidPage(
      leaflet::leafletOutput(outputId = "map", height = 400)
    ),
    server = function(input, output, session) {
      output$map <- leaflet::renderLeaflet({
        create_map_viewer(show_bridge_openings = "fake")
      })
    }
  )
}
