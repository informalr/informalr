#' Get real time bridge openings
#'
#' @export
#'
#' @examples
#' # Put example code here
get_bridge_openings <- function() {
  url <- "http://opendata.ndw.nu/brugopeningen.xml.gz"
  destdir <- tempdir()
  destfile <- file.path(destdir, "measurement_current.xml.gz")
  utils::download.file(url, destfile)
  tempfile <- tempfile()
  R.utils::gunzip(destfile, tempfile)
  doc <- xml2::read_xml(tempfile)
  file.remove(tempfile)
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
