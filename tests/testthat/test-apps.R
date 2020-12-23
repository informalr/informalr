library(shinytest)
# This file is for testing the applications in the apps/ directory.

test_that("app() and run_app() work", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use suffix parameter to test on multiple platforms (Ubuntu, macOS, Windows)
  # app
  # First test app to set up the shinytest work flow
  app1 <- "apps/app/"
  expect_pass(testApp(app1, suffix = strsplit(utils::osVersion, " ")[[1]][1]))
})
