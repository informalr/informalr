test_that("use", {
  skip("I did not create a function yet")
  expect_equal("barawaclawik", get_baras_github_username())
})

add_one(42)

add_one <- 42+1
add_one

usethis::use_test("add_one")
