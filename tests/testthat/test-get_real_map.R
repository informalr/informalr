test_that("use", {
  skip("Issue #64")
  get_real_map()
  expect_true(file.exists("./inst/extdata/groningen.png"))
})
