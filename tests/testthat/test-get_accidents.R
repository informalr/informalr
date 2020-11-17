test_that("use", {
  skip("Issue 104")
  # Returns all accidents
  t <- get_accidents()
  # It must be a tibble
  expect_true(tibble::is_tibble(t))
  # Column names must be latitude and longitude
  expect_equal(names(t), c("latitude", "longitude"))
  # Must have at least one row
  expect_true(nrow(t) > 0)
  # All values are numerics
  expect_true(all(is.numeric(t$latitude)))
  expect_true(all(is.numeric(t$longitude)))
})
