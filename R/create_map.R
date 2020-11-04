#' Create map
#'
#' Fetch a map of The Netherlands from OpenStreetMap
#' and save it as a PNG-file.
#'
#' @param png_filename name of the PNG that the map will be saved to
#' @export
create_map <- function(png_filename, show_bridge_openings = TRUE) {
  bbox <- osmdata::getbb("Groningen", featuretype = "state")
  groningen <- suppressMessages(ggmap::get_map(bbox, maptype = "toner_stamen", quiet = TRUE))
  p <- ggmap::ggmap(groningen)
  if (show_bridge_openings) {
    data <- NULL; rm(data) # nolint, fixes warning: no visible  binding
    data <- informalr::get_bridge_openings()
    data$lat <- as.numeric(data$lat)
    data$lon <- as.numeric(data$lon)
    data <- data[data$lat >= bbox["y", "min"] &
                 data$lat <= bbox["y", "max"] &
                 data$lon >= bbox["x", "min"] &
                 data$lon <= bbox["x", "max"], ]
    p <- p  +
      ggplot2::geom_point(data = data,
                          ggplot2::aes(x = lon, y = lat),
                          colour = I("red"), size = I(3))
    }
  suppressMessages(ggplot2::ggsave(filename = png_filename, plot = p))
}
