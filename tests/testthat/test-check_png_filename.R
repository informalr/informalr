test_that("check png_filename argument", {
  expect_error(
    create_map(
      png_filename = 42
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
