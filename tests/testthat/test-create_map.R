test_that("use", {
  png_filename <- tempfile(fileext = ".png")
  expect_silent(
    create_map(
      show_brige_openings = TRUE,
      png_filename = png_filename
    )
  )

  expect_true(file.exists(png_filename))
  expect_silent(
    create_map(
      show_brige_openings = FALSE,
      png_filename = png_filename
    )
  )
  expect_true(file.exists(png_filename))
})
