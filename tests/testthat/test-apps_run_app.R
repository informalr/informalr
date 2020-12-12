library(shinytest)
# This file is for testing the applications in the apps/ directory.

test_that("app() and run_app() work", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use suffix parameter to test on multiple platforms (Ubuntu, macOS, Windows)
  # run_app
  # Second app: testing leaflet
  app2 <- "apps/run_app/"
  expect_pass(testApp(app2,
                      compareImages = FALSE,
                      suffix = strsplit(utils::osVersion, " ")[[1]][1]))
})
