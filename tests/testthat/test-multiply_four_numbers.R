test_that("multiplication works", {
  expect_equal(2 * 2 * 2 * 2, 16)
})

test_that("multiplication works", {
  expect_error(
    multiply_four_numbers(Inf, 3, 3, 2),
    "First argument must be a number"
  )
  expect_error(
    multiply_four_numbers(1, "n", 3, 2),
    "Second argument must be a number"
  )
  expect_error(
    multiply_four_numbers(1, 2, "n", 1),
    "Third argument must be a number"
  )
})
