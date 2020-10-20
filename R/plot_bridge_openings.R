#' Create map
#'
#' Fetch a map of the province (state) Groningen from OpenStreetMap
#' Fetch bridge openings using function get_bridge_openings
#' Plot openings on top of Groningen
#' and save it as a PNG-file.
#'
#' @param png_filename name of the PNG that the map will be saved to
#' @importFrom informalr %get_bridge_openings%
#' @export
plot_bridge_openings <- function(png_filename) {
  library(maps)
  library(ggmap)
  data <- NULL; rm(data) # nolint, fixes warning: no visible  binding
  data <- informalr::get_bridge_openings()
  data$lat <- as.numeric(data$lat)
  data$lon <- as.numeric(data$lon)
  bbox <- osmdata::getbb("Groningen", featuretype = "state")
  groningen <- ggmap::get_map(bbox, maptype = "toner_stamen")
  p <- ggmap::ggmap(groningen) +
  ggplot2::geom_point(data = data, aes(x = lon, y = lat),
                      colour = I("red"), size = I(3))
  ggplot2::ggsave(filename = png_filename, plot = p)
}
