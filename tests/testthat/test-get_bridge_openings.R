test_that("use", {
  expect_true(nrow(get_bridge_openings(fake_data = TRUE)) > 0)
})

bridges <- get_bridge_openings(fake_data = FALSE)
if (nrow(bridges) > 0) {
  test_that("longitude", {
    expect_true(as.double(bridges$lon)[1] <= 180)
    expect_true(as.double(bridges$lon)[1] >= -180)
  })

  test_that("latitude", {
    expect_true(as.double(bridges$lat)[1] <= 90)
    expect_true(as.double(bridges$lat)[1] >= 0)
  })

  test_that("latitude and longitude are numerical", {
    expect_true(all(is.numeric(bridges$lat)))
    expect_true(all(is.numeric(bridges$lon)))
  })

}

test_that("no NA data", {
  skip("Issue #141")
  # Need to write code here to expose issue
})

test_that("no duplicate data", {
  bridges <- get_bridge_openings(fake_data = FALSE)

  # How to simplify this?
  # for(i in 1:length(bridges$lat)) {
    bool <- bridges$lat[1] != bridges$lat[2] || bridges$lon[1] != bridges$lon[2]
    expect_true(bool)
  # }
})
