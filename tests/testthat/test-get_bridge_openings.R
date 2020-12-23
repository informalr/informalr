library(mockery)

test_that("use", {
  expect_true(nrow(get_bridge_openings()) > 0)
})

bridges <- get_bridge_openings()
if (nrow(bridges) > 0) {
  test_that("longitude", {
    expect_true(as.double(bridges$lon)[1] <= 180)
    expect_true(as.double(bridges$lon)[1] >= -180)
  })

  test_that("latitude", {
    expect_true(as.double(bridges$lat)[1] <= 90)
    expect_true(as.double(bridges$lat)[1] >= 0)
  })

  test_that("latitude and longitude are numerical", {
    expect_true(all(is.numeric(bridges$lat)))
    expect_true(all(is.numeric(bridges$lon)))
  })

}

# Using the mockery package to test functions on fake data
# Mock data
fake_xml_bridges <- mock(xml2::read_xml("./test_dataset/bridges.xml"),
                         cycle = TRUE)
# Stub out the function which in 'normal' circumstances would fetch the data
# in real time
stub(informalr::get_bridge_openings,
     "informalr::get_xml_from_url",
     fake_xml_bridges)
# Store the output of the get_bridge_openings() function for testing purposes
result <- informalr::get_bridge_openings()

test_that("NA data", {
  skip("Issue #141")
  expect_false(is.na(result$lat))
  expect_false(is.na(result$lon))
  expect_called(fake_xml_bridges, 1)
})

test_that("no duplicate data", {
  expect_true(anyDuplicated(result) == 0)
  expect_called(fake_xml_bridges, 1)
})
