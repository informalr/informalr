#' Get real time bridge openings
#'
#' @export
#'
#' @examples
#' # Put example code here
get_bridge_openings <- function() {
  url <- "http://opendata.ndw.nu/brugopeningen.xml.gz"
  destfile <- "./inst/extdata/measurement_current.xml.gz"
  utils::download.file(url, destfile)
  tempfile <- tempfile()
  R.utils::gunzip(destfile, tempfile)
  doc <- xml2::read_xml(tempfile)
  file.remove(tempfile)
  ns <- xml2::xml_ns(doc)
  lat <- xml2::xml_text(xml2::xml_find_all(doc, ".//d1:latitude", ns))
  lon <- xml2::xml_text(xml2::xml_find_all(doc, ".//d1:longitude", ns))
  return(data.frame(lat = lat, lon = lon))
}
