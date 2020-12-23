#' Get real time bridge openings
#'
#' @export
#'
#' @examples
#' get_bridge_openings()
get_bridge_openings <- function() {
  url <- "http://opendata.ndw.nu/brugopeningen.xml.gz"
  doc <- informalr::get_xml_from_url(url)
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
