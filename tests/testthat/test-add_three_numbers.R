library(testthat)

test_that("add three numbers", {
  skip("Issue 31")
  expect_equal(add_three_numbers(1, 2, 3), 6)
})

