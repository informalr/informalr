test_that("use", {
  expect_equal(modulo_two_numbers(15, 5), 0)
  expect_equal(modulo_two_numbers(0, 15), 0)
  expect_equal(modulo_two_numbers(4, 5), 4)
  expect_equal(modulo_two_numbers(5.37, 1.45), 1.02)
  expect_equal(modulo_two_numbers(13, 3), 1)
  expect_equal(modulo_two_numbers(-13, 3), 2)
  expect_equal(modulo_two_numbers(13, -3), -2)
  expect_equal(modulo_two_numbers(-13, -3), -1)
  expect_true(is.na(modulo_two_numbers(1, 0)))
})

test_that("abuse", {
  expect_error(modulo_two_numbers("a", 42),
               "The first argument must be a number")
  expect_error(modulo_two_numbers(42, "b"),
               "The second argument must be a number")
  expect_error(modulo_two_numbers(NULL, 42),
               "The first argument must be a number")
  expect_error(modulo_two_numbers(42, NULL),
               "The second argument must be a number")
  expect_error(modulo_two_numbers(NA, 42),
               "The first argument must be a number")
  expect_error(modulo_two_numbers(42, NA),
               "The second argument must be a number")
})
