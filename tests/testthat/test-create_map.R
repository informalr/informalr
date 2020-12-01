test_that("show fake bridge openings", {
  png_filename_basemap <- tempfile(fileext = ".png")
  expect_silent(
    create_map(
      show_bridge_openings = "no",
      png_filename = png_filename_basemap
    )
  )
  expect_true(file.exists(png_filename_basemap))

  png_filename_fake <- tempfile(fileext = ".png")
  expect_silent(
    create_map(
      show_bridge_openings = "fake",
      png_filename = png_filename_fake
    )
  )
  expect_true(file.exists(png_filename_fake))
  expect_true(file.size(png_filename_basemap) !=
                file.size(png_filename_fake))
})

test_that("show bridge openings", {
  png_filename_bridge_openings <- tempfile(fileext = ".png")
  expect_silent(
    create_map(
      show_bridge_openings = "yes",
      png_filename = png_filename_bridge_openings
    )
  )
  expect_true(file.exists(png_filename_bridge_openings))
})

test_that("show a certain rectangle of the map", {
  png_filename <- tempfile(fileext = ".png")
  expect_silent(
    create_map(
      png_filename = png_filename,
      show_bridge_openings = "yes",
      left_lon = 6.50, # The left longiture
      right_lon = 7.0, # The right-hand-side longiture
      top_lat = 53.3, # The upper latitude
      bottom_lat = 53.0 # The lower latitude
    )
  )
})

test_that("show bike traffic density", {
  skip("Issue 97. Issue #97")
  expect_silent(
    create_map(
      png_filename = png_filename,
      show_bike_traffic_density = TRUE
    )
  )
})

test_that("show car traffic density", {
  skip("Issue 98. Issue #98")
  expect_silent(
    create_map(
      png_filename = png_filename,
      show_car_traffic_density = TRUE
    )
  )
})

test_that("show accidents", {
  skip("Issue 101. Issue #101")
  expect_silent(
    create_map(
      png_filename = png_filename,
      show_accidents = TRUE
    )
  )
})
