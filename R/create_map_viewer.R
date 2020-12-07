#' Create map viewer
#'
#' Create an interactive map viewer.
#'
#' @param show_bridge_openings boolean indicating whether or not to
#' show bridge openings on top of base map
#' @export
create_map_viewer <- function(show_bridge_openings = TRUE) {
  informalr::check_show_bridge_openings(show_bridge_openings)
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
