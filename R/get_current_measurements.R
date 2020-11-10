#' Get current measurements of traffic
#'
#' @export
#'
#' @examples
#' # Put example code here
get_current_measurements <- function() {
  url <- "http://opendata.ndw.nu/measurement_current.xml.gz"
  cachedir <- rappdirs::user_cache_dir(appname = "informalr")
  destdir <- file.path(cachedir, "extdata")
  if (!file.exists(destdir)) dir.create(destdir, recursive = TRUE)
  destfile <- file.path(destdir, "measurement_current.xml.gz")
  utils::download.file(url, destfile)
  tempfile <- tempfile()
  R.utils::gunzip(destfile, tempfile)
  doc <- xml2::read_xml(tempfile)
  file.remove(tempfile)
  ns <- xml2::xml_ns(doc)
  query_value <- ".//d1:measurementSiteRecord/d1:measurementSiteName"
  query_value <- paste(query_value,"/d1:values/d1:value", sep = "")
  value <- xml2::xml_text(xml2::xml_find_all(doc, query_value, ns))
  value <- value[1:5]
  lat <- vector()
  lon <- vector()
  for (val in 1:length(value)) {
  query_lat <- ".//d1:measurementSiteLocation"
  query_lat <- paste(query_lat,"/d1:locationForDisplay/", sep = "")
  query_lon <- paste(query_lat,"d1:longitude", sep = "")
  query_lat <- paste(query_lat,"d1:latitude", sep = "")
  query_lat <- paste(query_lat,"[../../../d1:measurementSiteName/d1:values/d1:value/text() = ", sep = "")
  query_lon <- paste(query_lon,"[../../../d1:measurementSiteName/d1:values/d1:value/text() = ", sep = "")
  query_lat <- paste(query_lat, "'", toString(value[val]), "']", sep = "")
  query_lon <- paste(query_lon, "'", toString(value[val]), "']", sep = "")
    lat <- append(lat, xml2::xml_text(xml2::xml_find_first(doc, query_lat, ns)))
    lon <- append(lon, xml2::xml_text(xml2::xml_find_first(doc, query_lon, ns)))
       }
  return(data.frame(lat = lat, lon = lon, value = value))
}
