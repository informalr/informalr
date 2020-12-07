test_that("use", {
  mockery::stub(
    create_map_viewer,
    "informalr::get_bridge_openings",
    get_fake_bridge_openings
  )
  map <- create_map_viewer()
  expect_true(class(map)[1] == "leaflet")
  expect_true(is.object(map))
})
