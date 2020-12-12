test_that("use", {
  expect_silent(doc <- get_xml("http://opendata.ndw.nu/brugopeningen.xml.gz"))
  expect_true("xml_document" %in% class(doc))
})
