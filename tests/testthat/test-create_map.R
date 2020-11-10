test_that("use", {
  png_filename <- tempfile(fileext = ".png")
  expect_silent(
    create_map(
      show_bridge_openings = TRUE,
      png_filename = png_filename
    )
  )
  expect_true(file.exists(png_filename))

  expect_silent(
    create_map(
      show_bridge_openings = FALSE,
      png_filename = png_filename
    )
  )
  expect_true(file.exists(png_filename))
})


test_that("show a certain rectangle of the map", {
  skip("Issue 94. Issue #94")
  expect_silent(
    create_map(
      png_filename = png_filename,
      left_lon = 6.50, # The left longiture
      right_lon = 7.0, # The right-hand-side longiture
      top_lat = 53.3, # The upper latitude
      bottom_lat = 53.0, # The lower latitude
    )
  )
})

test_that("show show bike traffic density", {
  skip("Issue 97. Issue #97")
  expect_silent(
    create_map(
      png_filename = png_filename,
      show_bike_traffic_density = TRUE
    )
  )
})
