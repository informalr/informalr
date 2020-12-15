test_that("use", {
  map <- create_map_viewer(show_bridge_openings = "fake")
  expect_true(class(map)[1] == "leaflet")
  expect_true(is.object(map))
})
