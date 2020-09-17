# Vraag: Hoe haal je van alle bruggen de coordinaten op?

# Eerst oefenen met een testbestand
# Het XML-testbestand bevat een overzicht met projectleden.
# Kunnen we in één keer alle namen van projectleden opvragen?
doc <- XML::xmlParse('<projectleden><projectlid><naam>willy</naam></projectlid><projectlid><naam>Geert</naam></projectlid><projectlid><naam>Richel</naam></projectlid></projectleden>')
XML::xmlValue(doc["/projectleden/projectlid/naam"]) # optie 1 - volledige pad
XML::xmlValue(doc["//naam"]) # optie 2
# Gelukt!

# Nu voor het bestand met bruggen!

# Stap 1 is het downloaden en parsen van het XML bestand

# webadres waar traffic data opstaat
url <- "http://opendata.ndw.nu/brugopeningen.xml.gz"
# adres waar heen gaat
destfile <- "./inst/extdata/measurement_current.xml.gz"
# download the file and save
download.file(url, destfile)
# create a temporary directory to put the extracted file
dir.create("./inst/tempdata")
temporaryfile <- "./inst/tempdata/data.xml"
# unzip the file
R.utils::gunzip(destfile, temporaryfile)
# Parse het XML-bestand
# The R package XML for parsing and manipulation of XML documents in R is not actively maintained anymore.
# The R package xml2 is an actively maintained, more recent alternative.
doc <- xml2::read_xml(temporaryfile)
# delete temporaryfile
file.remove(temporaryfile)

# Longitude en latitude van de eerste brug in het bronbestand
# I read that XML is not actively developed anymore and replaced by xml2
# So switching to the xml2 package
x <- xml2::read_xml(temporaryfile)
xml2::xml_find_all(doc, ".//SOAP:Body/d2LogicalModel")
ns <- xml2::xml_ns(doc)
print(ns)
# Because some nodes are prefixed with a namespace, you have to prefix ALL nodes
# Also the ones that use the default namespace
lat <- xml2::xml_text(xml2::xml_find_all(doc, ".//d1:latitude", ns))
long <- xml2::xml_text(xml2::xml_find_all(doc, ".//d1:longitude", ns))
