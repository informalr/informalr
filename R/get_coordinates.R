#' Collect GPS coordinates from the NDW website
#'
#'
#' This function fetches GPS coordinates from online sources:
#' measurements: http://opendata.ndw.nu/measurement_current.xml.gz
#' Add others here ...
#'
#' @param category specify category (measurements,...)
#'
#' @examples
#' \dontrun{get_coordinates()}
#' \dontrun{get_coordinates("measurements")}
#'
#' @author Claudio Tiecher
#'
#' @export
get_coordinates <- function(category = "measurements") {
  if (category == "measurements") {
    measurements_url <-
      "http://opendata.ndw.nu/measurement_current.xml.gz"
    doc <- informalr::get_xml_from_url(measurements_url)
    parents <-
      xml2::xml_find_all(doc, ".//d1:measurementSiteRecord")
    # Get object values, longitudes and site names
    lon_q <-
      ".//d1:measurementSiteLocation//d1:locationForDisplay/d1:longitude"
    lat_q <-
      ".//d1:measurementSiteLocation//d1:locationForDisplay/d1:latitude"
    lon <- xml2::xml_text(xml2::xml_find_first(parents, lon_q))
    lat <- xml2::xml_text(xml2::xml_find_first(parents, lat_q))
  } else if (category == "bridges") {
    bridges_url <- "http://opendata.ndw.nu/brugopeningen.xml.gz"
    doc <- informalr::get_xml_from_url(bridges_url)
    ns <- xml2::xml_ns(doc)
    c1 <- ".//d1:situationRecord[d1:probabilityOfOccurrence/text() = 'certain']"
    c2 <- "/d1:groupOfLocations/d1:locationForDisplay/d1:latitude"
    lat <- xml2::xml_text(xml2::xml_find_all(doc,
                                             paste0(c1, c2),
                                             ns))
    c3 <- "/d1:groupOfLocations/d1:locationForDisplay/d1:longitude"
    lon <- xml2::xml_text(xml2::xml_find_all(doc,
                                             paste0(c1, c3),
                                             ns))
  } else {
    stop(paste0("Category unknown: ", category))
  }
  data.frame(lat = as.numeric(lat), lon = as.numeric(lon)) %>% stats::na.omit()
}
