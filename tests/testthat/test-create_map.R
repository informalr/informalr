test_that("use", {
  skip("Issue 64, test not working properly")
  png_filename <- tempfile(fileext = ".png")
  create_map(png_filename = png_filename)
  expect_true(file.exists(png_filename))
})
