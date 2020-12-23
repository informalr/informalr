#' Create map viewer
#'
#' Create an interactive map viewer.
#'
#' @param show_bridge_openings character string indicating whether or not
#' bridge openings are plotted on top of the basemap. The default,
#' \code{"yes"} adds the real time bridge openings to the map. \code{"fake"}
#' adds one fake bridge opening in the center of Groningen. \code{"no"}
#' does not add any bridge openings to the map.
#' @export
create_map_viewer <- function(show_bridge_openings = "yes") {
  informalr::check_show_bridge_openings(show_bridge_openings)
  map <- leaflet::leaflet()
  map <- leaflet::addTiles(map)
  map <- leaflet::setView(map, lng = 6.8, lat = 53.3, zoom = 9)

  if (show_bridge_openings %in% c("yes", "fake")) {
    data <- informalr::get_bridge_openings()
    data$lon <- as.numeric(data$lon)
    data$lat <- as.numeric(data$lat)
    map <- leaflet::addMarkers(map, data = data, lng = ~lon, lat = ~lat)
  }
  return(map)
}
