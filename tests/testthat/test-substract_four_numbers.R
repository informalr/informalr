test_that("subtraction by 4 works", {
  expect_equal(subtract_four_numbers(5), 1)
})


test_that("use", {
  expect_error(
  subtract_four_numbers("nonsense"),
    "Argument must be a number"
  )
})
