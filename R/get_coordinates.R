#' Collect GPS coordinates from the NDW website
#'
#' This function fetches GPS coordinates from online sources:
#' measurements: http://opendata.ndw.nu/measurement_current.xml.gz
#' Add others here ...
#'
#' @param cat specify category (measurements,...)
#'
#' @examples
#' \dontrun{get_coordinates()}
#' \dontrun{get_coordinates("measurements")}
#' @author Claudio Tiecher
#' @export
get_coordinates <- function(cat = "measurements") {
  if (cat == "measurements") {
    measurements_url <- "http://opendata.ndw.nu/measurement_current.xml.gz"
    doc <- informalr::get_xml_from_url(measurements_url)
    parents <- xml2::xml_find_all(doc, ".//d1:measurementSiteRecord")
    # Get object values, longitudes and site names
    lon_q <- ".//d1:measurementSiteLocation//d1:locationForDisplay/d1:longitude"
    lat_q <- ".//d1:measurementSiteLocation//d1:locationForDisplay/d1:latitude"
    lon <- xml2::xml_text(xml2::xml_find_first(parents, lon_q))
    lat <- xml2::xml_text(xml2::xml_find_first(parents, lat_q))
  } else {
    stop(paste0("Category unknown: ", cat))
  }
  data.frame(lat = as.numeric(lat), lon = as.numeric(lon))
}
