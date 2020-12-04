#' Create map
#'
#' Fetch a map of Groningen from OpenStreetMap
#' and save it as a PNG-file.
#'
#' @param png_filename name of the PNG that the map will be saved to
#' @param show_bridge_openings character string indicating whether or not
#' bridge openings are plotted on top of the basemap. The default,
#' \code{"yes"} adds the real time bridge openings to the map. \code{"fake"}
#' adds one fake bridge opening in the center of Groningen. \code{"no"}
#' does not add any bridge openings to the map.
#' @param right_lon right longitude
#' @param left_lon left longitude
#' @param top_lat top latitude
#' @param bottom_lat bottom latitude
#' @export
create_map <- function(
  png_filename,
  show_bridge_openings = "yes",
  right_lon = 1.0,
  left_lon = 2.0,
  top_lat = 3.0,
  bottom_lat = 4.0
) {
  informalr::check_show_bridge_openings(show_bridge_openings)
  bbox <- osmdata::getbb("Groningen", featuretype = "state")
  groningen <- suppressMessages(
    ggmap::get_map(bbox, maptype = "toner_stamen", quiet = TRUE))
  p <- ggmap::ggmap(groningen)
  if (show_bridge_openings %in% c("yes", "fake")) {
    data <- informalr::get_bridge_openings(
      fake_data = (show_bridge_openings == "fake"))
    data$lat <- as.numeric(data$lat)
    data$lon <- as.numeric(data$lon)
    data <- data[data$lat >= bbox["y", "min"] &
                 data$lat <= bbox["y", "max"] &
                 data$lon >= bbox["x", "min"] &
                 data$lon <= bbox["x", "max"], ]
    lon <- NULL; rm(lon) # nolint, fixes warning: no visible binding for global variable
    lat <- NULL; rm(lat) # nolint, fixes warning: no visible binding for global variable
    p <- p  +
      ggplot2::geom_point(data = data,
                          ggplot2::aes(x = lon, y = lat),
                          colour = I("red"), size = I(3))
    }
  suppressMessages(ggplot2::ggsave(filename = png_filename, plot = p))
}
