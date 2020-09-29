test_that("use", {
  expect_true(nrow(get_bridge_openings()) > 0)
})
