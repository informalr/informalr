test_that("use", {
  map <- create_map_viewer()
  expect_true(class(map)[1] == "leaflet")
})
