#' Download zipped XML-file and convert it to an XML document
#'
#' @param url Download URL of the zipped XML-file
#'
#' @return XML document
#' @export
#'
#' @examples
#' get_xml("http://opendata.ndw.nu/brugopeningen.xml.gz")
get_xml <- function(url) {
  zip_file <- tempfile(fileext = ".gz")
  utils::download.file(url, zip_file)
  xml_file <- tempfile(fileext = ".xml")
  R.utils::gunzip(filename = zip_file, destname = xml_file)
  doc <- xml2::read_xml(xml_file)
  file.remove(xml_file)
  return(doc)
}
