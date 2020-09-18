test_that("use", {
  skip("Issue 63, test not working properly")
  expect_true(nrow(get_bridge_bridge_openings()) > 0)
})
