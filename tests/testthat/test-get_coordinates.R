test_that("use with measurements category", {
  # Using the mockery package to test functions on fake data
  # Mock data
  fake_xml_measurements <-
    mock(xml2::read_xml("./test_dataset/measurements.xml"),
         cycle = TRUE)
  # Stub out the function which in 'normal' circumstances would fetch the data
  # in real time
  stub(informalr::get_coordinates,
       "informalr::get_xml_from_url",
       fake_xml_measurements)
  # Store the output of the get_bridge_openings() function for testing purposes
  result_measurements <- informalr::get_coordinates(cat = "measurements")
  expect_true("lat" %in% names(result_measurements))
  expect_true("lon" %in% names(result_measurements))
  expect_true(is.numeric(result_measurements$lat))
  expect_true(is.numeric(result_measurements$lon))
  expect_called(fake_xml_measurements, 1)
})

test_that("unknown category", {
  expect_error(get_coordinates(cat = "unknown"))
})
