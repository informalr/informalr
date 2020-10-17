test_that("use", {
  skip("Issue #63")
  expect_true(nrow(get_bridge_openings()) > 0)
})
