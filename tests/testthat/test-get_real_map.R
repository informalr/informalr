test_that("use", {
  get_real_map()
  expect_true(file.exists("./inst/extdata/groningen.png"))
})
