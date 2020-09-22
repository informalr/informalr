test_that("add_three_numbers", {
  expect_equal(add_three_numbers(1, 2, 3), 6)
})

test_that("add_three_numbers", {
  expect_error(
    add_three_numbers("nonsense", 3, 3),
    "First argument must be a number"
  )
  expect_error(
    add_three_numbers(42, "nonsense", 44),
    "Second argument must be a number"
  )
  expect_error(
    add_three_numbers(5, 5, "nonsense"),
    "Third argument must be a number"
  )
})
