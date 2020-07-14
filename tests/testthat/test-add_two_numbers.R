test_that("use", {
  expect_equal(add_two_numbers(2, 3), 5)
})

test_that("use", {
  expect_error(
    add_two_numbers("nonsense", 3),
    "First argument must be a number"
  )
  expect_error(
    add_two_numbers(42, "nonsense"),
    "Second argument must be a number"
  )
})
