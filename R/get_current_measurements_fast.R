#' Get current measurements of traffic
#'
#' @export
#'
#' @examples
#' # Put example code here
get_current_measurements_fast<- function() {
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
  #find parent nodes
  parents<-xml2::xml_find_all(doc, ".//d1:measurementSiteRecord")
  #Get object values, longitudes and names
  value_query <-".//d1:measurementSiteName/d1:values/d1:value"
  lon_q<-".//d1:measurementSiteLocation//d1:locationForDisplay/d1:longitude"
  lat_q<-".//d1:measurementSiteLocation//d1:locationForDisplay/d1:latitude"
    value<-xml2::xml_find_first(parents, value_query) %>% xml2::xml_text()
    lon <- xml2::xml_find_first(parents, lon_q) %>% xml2::xml_text()
    lat <- xml2::xml_find_first(parents, lat_q) %>% xml2::xml_text()
#get only the density from the value (so remove name of road)
    value<-gsub("^.* ", "", value)
    value<-as.numeric(value)/20
  return(data.frame(lat = lat, lon = lon, value = value))
}
