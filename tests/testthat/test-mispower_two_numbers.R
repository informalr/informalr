test_that("mis", {
  expect_silent(power_two_numbers(8, 21))

  expect_error(
    power_two_numbers("cow", 7),
    "First argument must be a number"
  )
})
# Testing the proper usage of the exponentiation function
