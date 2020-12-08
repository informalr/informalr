library(shinytest)
# This file is for testing the applications in the apps/ directory.

test_that("app works", {
  skip("Nope")
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  app <- "apps/app/"
  shinytest::expect_pass(
    shinytest::testApp(
      app,
      suffix = strsplit(utils::osVersion, " ")[[1]][1]
    )
  )
})
