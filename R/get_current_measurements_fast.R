#' Get current measurements of traffic
#'
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' # Put example code here
get_car_densities <- function() {
  # download the positions of the measurement loops from NDW site
  url <- "http://opendata.ndw.nu/measurement_current.xml.gz"
  destdir <- tempdir()
  if (!file.exists(destdir)) dir.create(destdir, recursive = TRUE)
  destfile <- file.path(destdir, "measurement_current.xml.gz")
  # unzip the file
  utils::download.file(url, destfile)
  tempfile <- tempfile()
  R.utils::gunzip(destfile, tempfile)
  doc <- xml2::read_xml(tempfile)
  file.remove(tempfile)
  # find parent nodes in the XML with all the measurement points
  parents <- xml2::xml_find_all(doc, ".//d1:measurementSiteRecord")
  # Get object values, longitudes and site names
  left <- ".//d1:measurementSiteLocation//d1:locationForDisplay/"
  lon_q <- paste(left, "d1:longitude", sep = "")
  lat_q <- paste(left, "d1:latitude", sep = "")
  site_names_1 <- xml2::xml_find_all(doc,
              ".//d1:measurementSiteRecord") %>% xml2::xml_attr("id")
  lon <- xml2::xml_find_first(parents, lon_q
                              )  %>% xml2::xml_text() #nolint
  lat <- xml2::xml_find_first(parents, lat_q
                              )  %>% xml2::xml_text() #nolint
  # now download the second file with all the traffic densities
  url <- "http://opendata.ndw.nu/trafficspeed.xml.gz"
  destdir <- tempdir()
  if (!file.exists(destdir)) dir.create(destdir, recursive = TRUE)
  destfile <- file.path(destdir, "trafficspeed.xml.gz")
  utils::download.file(url, destfile)
  tempfile <- tempfile()
  # unzip this file as well
  R.utils::gunzip(destfile, tempfile)
  doc <- xml2::read_xml(tempfile)
  file.remove(tempfile)
  # now extract the location names and the traffic densities
  # the following part is still incorrect,
  # because it finds one more location than density
  # and because it only finds the density on one position
  # (rijbaan, weghelft)
  site_names_2 <- xml2::xml_find_all(doc,
                ".//d1:siteMeasurements/d1:measurementSiteReference"
  ) %>% xml2::xml_attr("id")
  dens_q <- ".//d1:siteMeasurements/d1:measuredValue[1]/"
  dens_q <- paste(dens_q, "d1:measuredValue/d1:basicData/", sep = "")
  dens_q <- paste(dens_q, "d1:vehicleFlow/d1:vehicleFlowRate", sep = "")
  density <- xml2::xml_find_all(doc, dens_q
                                ) %>% xml2::xml_integer()
  x <- data.frame(site_names_1 = site_names_1, lon = lon, lat = lat)
  nr <- length(density)
  site_names_2 <- data.frame(site_names_2 = site_names_2)
  site_names_2 <- dplyr::slice(site_names_2, 1:nr)
  y <- data.frame(site_names_2 = site_names_2, density = density)
  names(y)[1] <- "site_names_1"
  result_cars <-  dplyr::inner_join(x, y, by = NULL, copy = NULL)
  car_densities <- dplyr::pull(result_cars, 4)
  lon <- dplyr::pull(result_cars, 2)
  lat <- dplyr::pull(result_cars, 3)
  # return the data frame
  data.frame(car_densities = car_densities, lon = lon, lat = lat)
}
