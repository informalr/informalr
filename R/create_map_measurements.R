#' Create a map of Groningen with car densities.
#'
#' Fetch a map of Groningen and plot the densities of cars in the area
#' using the data from the Dutch government.
#'
#' @param png_filename name of the PNG that the map will be saved to
#' @param show_measurements plot measurements on the map YES/NO?
#'
#' @export
create_map_car_densities <- function(png_filename,
                                     show_measurements=TRUE) {
  bbox <- osmdata::getbb("Groningen", featuretype = "state")
  groningen <- ggmap::get_map(bbox, maptype = "toner_stamen")
  p <- ggmap::ggmap(groningen)
  if (show_measurements) {
    data <- NULL; rm(data) # nolint, fixes warning: no visible  binding
    data <- informalr::get_car_densities()
    data$lat <- as.numeric(data$lat)
    data$lon <- as.numeric(data$lon)
    data$car_densities <- as.numeric(data$car_densities)
    data$car_densities <- data$car_densities / 100
    p <- p  +
      ggplot2::geom_point(data = data,
                          ggplot2::aes(x = data$lon, y = data$lat),
                          colour = I("red"), size = data$car_densities)
  }
  # colour = I("red"), size = I(3), label = data$value)}
  ggplot2::ggsave(filename = png_filename, plot = p)
  }
