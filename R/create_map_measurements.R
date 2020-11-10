#' Create map
#'
#' Fetch a map of Groningen from OpenStreetMap
#' and save it as a PNG-file.
#'
#' @param png_filename name of the PNG that the map will be saved to
#' @export
create_map_measurements <- function(png_filename, show_measurements=TRUE) {
  bbox <- osmdata::getbb("Groningen", featuretype = "state")
  groningen <- ggmap::get_map(bbox, maptype = "toner_stamen")
  p <- ggmap::ggmap(groningen)
  if(show_measurements) {
    data <- NULL; rm(data) # nolint, fixes warning: no visible  binding
    data <- informalr::get_current_measurements()
    data$lat <- as.numeric(data$lat)
    data$lon <- as.numeric(data$lon)
    data$value <- as.numeric(data$value)
    p <- p  +
      ggplot2::geom_point(data = data,
                          ggplot2::aes(x = data$lon, y = data$lat),
                          colour = I("red"), size = I(3), label = data$value)}
  ggplot2::ggsave(filename = png_filename, plot = p)
}
