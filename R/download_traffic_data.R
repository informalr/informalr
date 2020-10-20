# # install the package wchich allow extraction of gz file
# install.packages("R.utils")
# # Load the package required to read XML files.
# install.packages("XML")
# # webadres waar traffic data opstaat
# url <- "http://opendata.ndw.nu/brugopeningen.xml.gz"
# # adres waar heen gaat
# destfile <- "./inst/extdata/measurement_current.xml.gz"
# # download the file and save
# download.file(url, destfile)
# # create a temporary directory to put the extracted file
# dir.create("./inst/tempdata")
# temporaryfile <- "./inst/tempdata/data.xml"
# # unzip the file
# R.utils::gunzip(destfile, temporaryfile)
# #delete original file
# file.remove(destfile)
# # Print the result.
# result <- XML::xmlParse(temporaryfile)
# print(result)
# # delete temporaryfile
# file.remove(temporaryfile)

