#' Create map
#'
#' Fetch a map of Groningen from OpenStreetMap
#' and save it as a PNG-file.
#'
#' @param png_filename name of the PNG that the map will be saved to
#' @export
create_map <- function(png_filename, show_bridge_openings=TRUE) {
  bbox <- osmdata::getbb("Groningen", featuretype = "state")
  groningen <- ggmap::get_map(bbox, maptype = "toner_stamen")
  p <- ggmap::ggmap(groningen)
  if(show_bridge_openings) {
    data <- NULL; rm(data) # nolint, fixes warning: no visible  binding
    data <- informalr::get_bridge_openings()
    data$lat <- as.numeric(data$lat)
    data$lon <- as.numeric(data$lon)
    p <- p  +
      ggplot2::geom_point(data = data,
                          ggplot2::aes(x = data$lon, y = data$lat),
                          colour = I("red"), size = I(3))}
  ggplot2::ggsave(filename = png_filename, plot = p)
}
