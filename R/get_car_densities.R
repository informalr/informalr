#' Get current measurements of traffic
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' get_car_densities("http://opendata.ndw.nu/brugopeningen.xml.gz")
#' }
get_car_densities <- function() {
  # Download the positions of the measurement loops from NDW site
  doc <- get_xml("http://opendata.ndw.nu/measurement_current.xml.gz")

  # Find parent nodes in the XML with all the measurement points
  parents <- xml2::xml_find_all(doc, ".//d1:measurementSiteRecord")
  # Get object values, longitudes and site names
  lon_q <- ".//d1:measurementSiteLocation//d1:locationForDisplay/d1:longitude"
  lat_q <- ".//d1:measurementSiteLocation//d1:locationForDisplay/d1:latitude"
  site_names_1 <- xml2::xml_attr(
    xml2::xml_find_all(doc, ".//d1:measurementSiteRecord")
  , "id")
  lon <- xml2::xml_text(xml2::xml_find_first(parents, lon_q))
  lat <- xml2::xml_text(xml2::xml_find_first(parents, lat_q))

  # Now download the second file with all the traffic densities
  doc <- get_xml("http://opendata.ndw.nu/trafficspeed.xml.gz")

  # Now extract the location names and the traffic densities
  # The following part is still incorrect,
  # because it finds one more location than density
  # and because it only finds the density on one position (rijbaan, weghelft)
  site_names_2 <- xml2::xml_attr(
    xml2::xml_find_all(doc,
                       ".//d1:siteMeasurements/d1:measurementSiteReference"),
    "id")
  dens_q <- paste0(".//d1:siteMeasurements/d1:measuredValue[1]/",
                   "d1:measuredValue/d1:basicData/d1:vehicleFlow/",
                   "d1:vehicleFlowRate")
  density <- xml2::xml_text(
    xml2::xml_find_all(doc, dens_q)
  )

  # This part is terribly slow
  # if the whole thing is done (with for(i in site_names_1)),
  # that is why I currently only check the first 1000
  for (i in 1:1000) {
    for (j in 1:1000) {
      if (isTRUE(identical(site_names_2[j], site_names_1[i]))) {

        site_names_1[i] <- density[j]

      }

    }
  }
  car_densities <- site_names_1

  # Return the dataframe
  data.frame(car_densities = car_densities, lon = lon, lat = lat)
}
