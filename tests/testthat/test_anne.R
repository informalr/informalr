usethis::use_test("add_three_numbers")

test_that("add three numbers works", {
  expect_equal(1 + 2 + 3, 6)
})

expect_equal(add_two_numbers(1, 2, 3), 6)

test_that("use", {
  skip("Issue 42")
  expect_equal(add_two_numbers(2, 2), 4)
})