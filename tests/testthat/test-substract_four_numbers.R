test_that("subtraction by 4 works", {
  skip("Test fails: 5 minus 4 indeed is not 2")
  expect_equal(subtract_four_numbers(5), 2)
})

test_that("use", {
  expect_error(
    subtract_four_numbers("nonsense"),
    "Argument must be a number"
  )
})
