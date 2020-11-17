test_that("use", {
  expect_true(nrow(get_bridge_openings()) > 0)
})

test_that("longitude", {
  bridges <- get_bridge_openings()
  expect_true(as.double(bridges$lon)[1] <= 180)
  expect_true(as.double(bridges$lon)[1] >= -180)
})

test_that("latitude", {
  bridges <- get_bridge_openings()
  expect_true(as.double(bridges$lat)[1] <= 90)
  expect_true(as.double(bridges$lat)[1] >= 0)
})

test_that("latitude and longitude are numerical", {
  skip("Issue 96. Issue #96")
  bridges <- get_bridge_openings()
  expect_true(all(is.numeric(bridges$lat)))
  expect_true(all(is.numeric(bridges$lon)))
})
