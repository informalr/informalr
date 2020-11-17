#' Create map viewer
#'
#' Create an interactive map viewer.
#'
#' @param show_bridge_openings Add layer with bridge openings
#'                             on top of the base map
#' @export
create_map_viewer <- function(show_bridge_openings = TRUE) {
  map <- leaflet::leaflet()
  map <- leaflet::addTiles(map)
  map <- leaflet::setView(map, lng = 6.8, lat = 53.3, zoom = 9)

  if (show_bridge_openings) {
    data <- informalr::get_bridge_openings()
    data$lon <- as.numeric(data$lon)
    data$lat <- as.numeric(data$lat)
    map <- leaflet::addMarkers(map, data = data, lng = ~lon, lat = ~lat)
  }
  return(map)
}
