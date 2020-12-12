#' Get real time bridge openings
#'
#' @param fake_data Indicates whether to return test data.
#' (GPS location of the Martini tower.)
#' @export
#'
#' @examples
#' # Put example code here
get_bridge_openings <- function(fake_data = FALSE) {
  if (fake_data) {
    d <- data.frame(lat = 53.219167, lon = 6.568056)
    return(d)
  } else {
    url <- "http://opendata.ndw.nu/brugopeningen.xml.gz"
    doc <- informalr::get_xml(url)
    ns <- xml2::xml_ns(doc)
    c1 <- ".//d1:situationRecord[d1:probabilityOfOccurrence/text() = 'certain']"
    c2 <- "/d1:groupOfLocations/d1:locationForDisplay/d1:latitude"
    lat <- as.numeric(
      xml2::xml_text(
        xml2::xml_find_all(
          doc,
          paste0(c1, c2),
          ns)
      )
    )
    c3 <- "/d1:groupOfLocations/d1:locationForDisplay/d1:longitude"
    lon <- as.numeric(
      xml2::xml_text(
        xml2::xml_find_all(
          doc,
          paste0(c1, c3)
          , ns)
      )
    )
    return(data.frame(lat = lat, lon = lon))
  }
}
