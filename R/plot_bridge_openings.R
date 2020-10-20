#' Create map
#'
#' Fetch a map of Netherlands from OpenStreetMap
#' Fetch bridge openings using function get_bridge_openings
#' and save it as a PNG-file.
#'
#' @param png_filename name of the PNG that the map will be saved to
#' @export
create_map <- function(png_filename) {
  data <- get_bridge_openings()
  data$lat <- as.numeric(data$lat)
  data$lon <- as.numeric(data$lon)
  p <- ggmap::qmplot(lon, lat, data = data, colour = I('red'),
                     size = I(3), darken = .3)
  ggplot2::ggsave(filename = png_filename, plot = p)
}
