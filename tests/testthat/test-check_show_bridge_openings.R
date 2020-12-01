test_that("use", {
  expect_silent(check_show_bridge_openings("yes"))
  expect_silent(check_show_bridge_openings("no"))
  expect_silent(check_show_bridge_openings("fake"))
  expect_error(check_show_bridge_openings(TRUE))
  expect_error(check_show_bridge_openings(""))
  expect_error(check_show_bridge_openings(NULL))
  expect_error(check_show_bridge_openings(NA))
})
