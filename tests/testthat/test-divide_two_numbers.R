
test_that("divide_two_numbers use", {
    expect_equal(divide_two_numbers(4, 2), 2)
})

test_that("brutalize", {
  skip("Issue #34")
  expect_silent(divide_two_numbers(4, 2))

  expect_error(divide_two_numbers(dog, 1),
               "The first argument is not a number")

  expect_error(divide_two_numbers(1, dog),
               "The second argument is not a number")

  expect_error(divide_two_numbers(1, NA),
               "The second argument is NA")

  expect_error(divide_two_numbers(NA, 1),
               "The first argument is NA")

  expect_error(divide_two_numbers(1, Inf),
               "The second argument is infinity")

  expect_error(divide_two_numbers(Inf, 1),
               "The first argument is infinity")

  expect_error(divide_two_numbers(2, 0),
               "Cannot divide by 0!")

})
