test_that("subtraction by 4 works", {
<<<<<<< HEAD

=======
>>>>>>> 975bdbb1367237f1137f7ea17c4941ff0e295ead
  expect_equal(subtract_four_numbers(5), 1)
})


test_that("use", {
  expect_error(
  subtract_four_numbers("nonsense"),
    "Argument must be a number"
  )
})
