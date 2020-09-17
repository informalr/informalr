url <- "http://opendata.ndw.nu/brugopeningen.xml.gz"
destfile <- "./inst/extdata/measurement_current.xml.gz"
download.file(url, destfile)
dir.create("./inst/tempdata")
temporaryfile <- "./inst/tempdata/data.xml"
R.utils::gunzip(destfile, temporaryfile)
doc <- xml2::read_xml(temporaryfile)
file.remove(temporaryfile)
x <- xml2::read_xml(temporaryfile)
xml2::xml_find_all(doc, ".//SOAP:Body/d2LogicalModel")
ns <- xml2::xml_ns(doc)
lat <- xml2::xml_text(xml2::xml_find_all(doc, ".//d1:latitude", ns))
long <- xml2::xml_text(xml2::xml_find_all(doc, ".//d1:longitude", ns))
