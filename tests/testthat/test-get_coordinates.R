library(mockery)

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
  result_measurements <- informalr::get_coordinates(category = "measurements")
  test_that("dataframe contains lat and lon vectors", {
    expect_true("lat" %in% names(result_measurements))
    expect_true("lon" %in% names(result_measurements))
  })
  test_that("dataframe contains numeric type", {
    expect_true(is.numeric(result_measurements$lat))
    expect_true(is.numeric(result_measurements$lon))
  })
  if (nrow(result_measurements) > 0) {
    test_that("longitude must be within [-180, 180]", {
      skip("Unreported issue")
      expect_true(as.double(result_measurements$lon) <= 180)
      expect_true(as.double(result_measurements$lon) >= -180)
    })
    test_that("latitude must be within [0, 90]", {
      skip("Unreported issue")
      expect_true(as.double(result_measurements$lat) <= 90)
      expect_true(as.double(result_measurements$lat) >= 0)
    })
  }
  test_that("no NA", {
    expect_false(all(is.na(result_measurements$lat)))
    expect_false(all(is.na(result_measurements$lon)))
  })
  test_that("no duplicates", {
    expect_true(anyDuplicated(result_measurements) == 0)
  })
  expect_called(fake_xml_measurements, 1)
})

test_that("use with bridges category", {
  # Using the mockery package to test functions on fake data
  # Mock data
  fake_xml_bridges <-
    mock(xml2::read_xml("./test_dataset/bridges.xml"),
         cycle = TRUE)
  # Stub out the function which in 'normal' circumstances would fetch the data
  # in real time
  stub(informalr::get_coordinates,
       "informalr::get_xml_from_url",
       fake_xml_bridges)
  # Store the output of the get_bridge_openings() function for testing purposes
  result_bridges <- informalr::get_coordinates(category = "bridges")
  test_that("dataframe contains lat and lon vectors", {
    expect_true("lat" %in% names(result_bridges))
    expect_true("lon" %in% names(result_bridges))
  })
  test_that("dataframe contains numeric type", {
    expect_true(is.numeric(result_bridges$lat))
    expect_true(is.numeric(result_bridges$lon))
  })
  if (nrow(result_bridges) > 0) {
    test_that("longitude must be within [-180, 180]", {
      skip("Unreported issue")
      expect_true(as.double(result_bridges$lon) <= 180)
      expect_true(as.double(result_bridges$lon) >= -180)
    })
    test_that("latitude must be within [0, 90]", {
      skip("Unreported issue")
      expect_true(as.double(result_bridges$lat) <= 90)
      expect_true(as.double(result_bridges$lat) >= 0)
    })
  }
  test_that("no NA", {
    expect_false(all(is.na(result_bridges$lat)))
    expect_false(all(is.na(result_bridges$lon)))
  })
  test_that("no duplicates", {
    expect_true(anyDuplicated(result_bridges) == 0)
  })
  expect_called(fake_xml_bridges, 1)
})

test_that("unknown category", {
  expect_error(get_coordinates(cat = "unknown"))
})
