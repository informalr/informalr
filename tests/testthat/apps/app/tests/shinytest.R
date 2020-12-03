library(shinytest)
shinytest::testApp("../", compareImages = grepl("^Ubuntu", utils::osVersion))
