#' Download the xml file found at the given url
#'
#' @param url where to find the xml file
#' @export
#'
#' @examples
#' \dontrun{get_xml_from_url("http://opendata.ndw.nu/brugopeningen.xml.gz")}
get_xml_from_url <- function(url) {
  destdir <- tempdir()
  destfile <- file.path(destdir, "measurement_current.xml.gz")
  utils::download.file(url, destfile)
  tempfile <- tempfile()
  R.utils::gunzip(destfile, tempfile)
  doc <- xml2::read_xml(tempfile)
  file.remove(tempfile)
  return(doc)
}
