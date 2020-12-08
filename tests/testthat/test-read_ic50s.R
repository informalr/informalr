test_that("use", {
  expect_error(read_ic50s("nonsense"),
               "File inst/extdata/nonsense does not exist.")
  table <- read_ic50s()
  expect_true("Date" %in% names(table))
  expect_true("Status" %in% names(table))
  expect_true("Color" %in% names(table))
  expect_true("Model" %in% names(table))
  expect_true(is.factor(table$tool))
  expect_true(is.character(table$Color))
  expect_true(is.character(table$Agency))
  expect_true(is.numeric(table$Custom))
})
