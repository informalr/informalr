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
doc <- XML::xmlParse(temporaryfile)
# delete temporaryfile
file.remove(temporaryfile)

# Longitude en latitude van de eerste brug in het bronbestand
rootNode <- XML::xmlRoot(doc)
XML::xmlValue(rootNode[["Body"]][["d2LogicalModel"]][["payloadPublication"]][["situation"]][["situationRecord"]][["groupOfLocations"]][["locationForDisplay"]][["longitude"]])
XML::xmlValue(rootNode[["Body"]][["d2LogicalModel"]][["payloadPublication"]][["situation"]][["situationRecord"]][["groupOfLocations"]][["locationForDisplay"]][["latitude"]])

# Nu een lijst ophalen - op dezelfde manier als in het voorbeeld
XML::xmlValue(rootNode) # Dit werkt - je krijgt als tussen de <SOAP:Envelope> tag retour
names(rootNode)    # Het child element van de rootNode is Body
# Waarom retourneert dit dan een lege lijst?
XML::xmlValue(doc["//Body"])
# Dat komt door de namespace!
# Dit werkt wel
XML::xmlValue(doc["//SOAP:Body"])
# Maar dit jammer genoeg niet
XML::xmlValue(doc["//SOAP:Body/d2LogicalModel/payloadPublication/situation/situationRecord/groupOfLocations/locationForDisplay/longitude"])

