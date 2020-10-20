test_that("use", {
  skip("Issue 76")
  png_filename <- tempfile(fileext = ".png")
  expect_silent(create_map(png_filename = png_filename))
  expect_true(file.exists(png_filename))
})

test_that("display bridges", {
  png_filename <- tempfile(fileext = ".png")
  create_map(
    png_filename = png_filename,
    show_bridges = TRUE
  )

})
