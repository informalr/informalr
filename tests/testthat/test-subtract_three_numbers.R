test_that("subtraction by 3 works", {

  expect_equal(subtract_three_numbers(5), 2)
})

test_that("use", {
  expect_error(
    subtract_three_numbers("nonsense"),
    "Argument must be a number"
  )
  })
