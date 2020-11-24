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

test_that("check png_filename argument", {
  skip("Issue 99. Issue #99")
  expect_error(
    create_map(
      png_filename = 42
    ),
    "'png_filename' must be one word"
  )
  expect_error(
    create_map(
      png_filename = c("one filename", "too many")
    ),
    "'png_filename' must be one word"
  )
  expect_error(
    create_map(
      png_filename = NULL
    ),
    "'png_filename' must be one word"
  )
  expect_error(
    create_map(
      png_filename = c()
    ),
    "'png_filename' must be one word"
  )
  expect_error(
    create_map(
      png_filename = NA
    ),
    "'png_filename' must be one word"
  )
})

test_that("check show_bridge_openings argument", {
  expect_error(
    create_map(
      show_bridge_openings = 42
    ),
    "'show_bridge_openings' must be 'yes', 'no' or 'fake'"
  )
  expect_error(
    create_map(
      show_bridge_openings = c(TRUE, FALSE)
    ),
    "'show_bridge_openings' must be 'yes', 'no' or 'fake'"
  )
  expect_error(
    create_map(
      show_bridge_openings = NULL
    ),
    "'show_bridge_openings' must be 'yes', 'no' or 'fake'"
  )
  expect_error(
    create_map(
      show_bridge_openings = c()
    ),
    "'show_bridge_openings' must be 'yes', 'no' or 'fake'"
  )
  expect_error(
    create_map(
      show_bridge_openings = NA
    ),
    "'show_bridge_openings' must be 'yes', 'no' or 'fake'"
  )
})
