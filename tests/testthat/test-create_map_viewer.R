test_that("use", {
  map <- create_map_viewer(fake_data = TRUE)
  expect_true(class(map)[1] == "leaflet")
  expect_true(is.object(map))
})
