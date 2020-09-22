test_that("add_four_numbers", {
  expect_equal(add_four_numbers(1, 2, 3, 4), 10)
})

test_that("add_four_numbers", {
  expect_error(
    add_four_numbers("nonsense", 3, 3, 4),
    "First argument must be a number"
  )
  expect_error(
    add_four_numbers(42, "nonsense", 44, 45),
    "Second argument must be a number"
  )
  expect_error(
    add_four_numbers(5, 5, "nonsense", 34),
    "Third argument must be a number"
  )
  expect_error(
    add_four_numbers(5, 5, 34, "nonsense"),
    "Fourth argument must be a number"
  )
})
