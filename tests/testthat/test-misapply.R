test_that("misapply", {
  skip("Issue 34")
  expect_silent(add_one(42), 43)

  expect_error(
    add_one(42, 43),
    "First argument must be a number"
  )

  expect_error(
    add_one(42, 43),
    "Second argument must be a number"
  )
})

