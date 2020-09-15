test_that("use", {
  png_filename <- tempfile()
  create_map(png_filename = png_filename)
  expect_true(file.exists(png_filename))
})
