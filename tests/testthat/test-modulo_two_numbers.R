test_that("use", {
  expect_equal(modulo_two_numbers(3, 2), 1)
  expect_equal(modulo_two_numbers(10, 5), 0)
  expect_equal(modulo_two_numbers(0, 10), 0)
  expect_equal(modulo_two_numbers(4, 6), 4)
  expect_true(is.na(modulo_two_numbers(1, 0)))
})
