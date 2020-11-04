test_that("mis", {
  expect_silent(power_two_numbers(8, 21))
  # Testing the proper usage of the exponentiation function

  expect_error(
    power_two_numbers("cow", 7),
    "First argument must be a number"
  )

  expect_error(
    power_two_numbers(NA, 7),
    "First argument must be a number"
  )

  expect_error(
    power_two_numbers(13, "chicken"),
    "Second argument must be a number"
  )
})
