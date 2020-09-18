#' Get real map of Groningen
#'
#' Fetch a map of Groningen from OpenStreetMap
#' and save it as a PNG-file.
#'
#' @return
#' @export
#'
#' @examples
#' get_real_map()
get_real_map <- function() {
  bbox <- osmdata::getbb("Groningen")
  groningen <- ggmap::get_map(bbox, maptype = "toner-background")
  p <- ggmap::ggmap(groningen) + ggthemes::theme_map()
  ggplot2::ggsave(filename = "./inst/extdata/groningen.png", plot = p)
}
