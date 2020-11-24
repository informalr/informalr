test_that("use", {
  expect_true(nrow(get_bridge_openings(fake_data = TRUE)) > 0)
})

bridges <- get_bridge_openings(fake_data = FALSE)
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
    skip("Issue 96. Issue #96")
    expect_true(all(is.numeric(bridges$lat)))
    expect_true(all(is.numeric(bridges$lon)))
  })

}

test_that("no duplicate data", {
  skip("Issue #83")
  bridges <- get_bridge_openings(fake_data = FALSE)

  # The first row should differ from the second ...
  expect_true(bridges$lat[1] != bridges$lat[2] || bridges$lon[1] != bridges$lon[2])
  # ... likewise for other rows

  n <- length(bridges$lat)
  n_unique <- length(unique(bridges$lat))
  expect_equal(n, n_unique)
})
