context("app")
# This file is for testing the applications in the apps/ directory.

test_that("run_app() works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  shinytest::expect_pass(shinytest::testApp("apps/app/", compareImages = FALSE))
})
