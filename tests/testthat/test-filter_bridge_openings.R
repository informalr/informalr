test_that("use", {

  skip("Issue 93. Issue #93")
  # Get all the bridge opening
  all_bridge_openings <- get_bridge_openings()
  # Sure, a data frame (i.e. a table)
  expect_true(is.data.frame(all_bridge_openings))
  # Sure, column names are 'lat' and 'lon'
  expect_equal(names(all_bridge_openings), c("lat", "lon"))
  # This is the number of all bridge openings
  n_all_bridge_openings <- nrow(all_bridge_openings)

  # Only care about a part of Gronongen
  bridge_openings <- filter_bridge_openings(
    all_bridge_openings,
    left_lon = 6.50, # The left longiture
    right_lon = 7.0, # The right-hand-side longiture
    top_lat = 53.3, # The upper latitude
    bottom_lat = 53.0, # The lower latitude
  )

  # Also a data frame (i.e. a table)
  expect_true(is.data.frame(bridge_openings))
  # Also column names are 'lat' and 'lon'
  expect_equal(names(bridge_openings), c("lat", "lon"))
  # This is the number of all bridge openings
  n_bridge_openings <- nrow(bridge_openings)
  # Should definitely be less
  expect_true(n_bridge_openings < n_all_bridge_openings)
})
