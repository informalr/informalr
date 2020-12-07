test_that("use", {
  expect_silent(check_show_bridge_openings(TRUE))
  expect_silent(check_show_bridge_openings(FALSE))
  expect_error(check_show_bridge_openings("yes"))
  expect_error(check_show_bridge_openings("no"))
})
