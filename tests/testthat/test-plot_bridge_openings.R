test_that("use", {
  skip("does not work, because of error in get bridge openings")
  png_filename <- tempfile(fileext = ".png")
  expect_silent(plot_bridge_openings(png_filename = png_filename))
  expect_true(file.exists(png_filename))
})
