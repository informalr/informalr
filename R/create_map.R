#' Create map
#'
#' Fetch a map of Groningen from OpenStreetMap
#' and save it as a PNG-file.
#'
#' @param png_filename name of the PNG that the map will be saved to
#' @export
create_map <- function(png_filename) {
  bbox <- osmdata::getbb("Groningen")
  groningen <- ggmap::get_map(bbox, maptype = "toner-background")
  p <- ggmap::ggmap(groningen) + ggthemes::theme_map()
  ggplot2::ggsave(filename = png_filename, plot = p)
}
