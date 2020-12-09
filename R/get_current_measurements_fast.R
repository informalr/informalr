#' Get current measurements of traffic
#'
#' @export
#'
#' @examples
#' # Put example code here
get_car_densities <- function() {
  #' download the positions of the measurement loops from NDW site
  url <- "http://opendata.ndw.nu/measurement_current.xml.gz"
  destdir <- tempdir()
  if (!file.exists(destdir)) dir.create(destdir, recursive = TRUE)
  destfile <- file.path(destdir, "measurement_current.xml.gz")
  #' unzip the file
  utils::download.file(url, destfile)
  tempfile <- tempfile()
  R.utils::gunzip(destfile, tempfile)
  doc <- xml2::read_xml(tempfile)
  file.remove(tempfile)
  #find parent nodes in the XML with all the measurement points
  parents <- xml2::xml_find_all(doc, ".//d1:measurementSiteRecord")
  #Get object values, longitudes and site names
  #'value_query <-".//d1:measurementSiteName/d1:values/d1:value"
  lon_q <- ".//d1:measurementSiteLocation//d1:locationForDisplay/d1:longitude"
  lat_q <- ".//d1:measurementSiteLocation//d1:locationForDisplay/d1:latitude"
  #'value<-xml2::xml_find_first(parents, value_query) %>% xml2::xml_text()
  site_names_1 <- xml2::xml_find_all(doc,
                                   ".//d1:measurementSiteRecord") %>%
                                   xml2::xml_attr("id")
  lon <- xml2::xml_text(xml2::xml_find_first(parents, lon_q))
  lat <- xml2::xml_text(xml2::xml_find_first(parents, lat_q))
  #' now download the second file with all the traffic densities
  url <- "http://opendata.ndw.nu/trafficspeed.xml.gz"
  destdir <- tempdir()
  if (!file.exists(destdir)) dir.create(destdir, recursive = TRUE)
  destfile <- file.path(destdir, "trafficspeed.xml.gz")
  utils::download.file(url, destfile)
  tempfile <- tempfile()
  #' unzip this file as well
  R.utils::gunzip(destfile, tempfile)
  doc <- xml2::read_xml(tempfile)
  file.remove(tempfile)
  #'now extract the location names and the traffic densities
  #' the following part is still incorrect,
  #' because it finds one more location than density
  #' and because it only finds the density on one position (rijbaan, weghelft)
  site_names_2 <- xml2::xml_find_all(
    doc,
    ".//d1:siteMeasurements/d1:measurementSiteReference"
  ) %>%
    xml2::xml_attr("id")
  dens_q <- paste0(".//d1:siteMeasurements/d1:measuredValue[1]/",
                   "d1:measuredValue/d1:basicData/d1:vehicleFlow/",
                   "d1:vehicleFlowRate")
  density <- xml2::xml_find_all(doc, dens_q) %>%
    xml2::xml_text()
  #' this part is terribly slow
  #' if the whole thing is done (with for(i in site_names_1)),
  #' that is why I currently only check the first 1000
  #'
  for (i in 1:1000) {
    for (j in 1:1000) {
      if (isTRUE(identical(site_names_2[j], site_names_1[i]))) {

        site_names_1[i] <- density[j]

      }

    }
  }
  car_densities <- site_names_1
  #return the daya frame
  data.frame(car_densities = car_densities, lon = lon, lat = lat)
}
