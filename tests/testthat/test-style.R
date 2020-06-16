test_that("Package style", {
  skip('This test will break the Travis build')
  lintr::expect_lint_free()
})
