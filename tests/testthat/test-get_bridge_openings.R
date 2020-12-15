test_that("use", {
  expect_true(nrow(get_bridge_openings()) > 0)
})

bridges <- get_bridge_openings()
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

  test_that("NA data", {
    # Mock out get_brige_openings
    # f <- get_bridge_openings(fake_data = FALSE)
    # mock <- mockery::mock(data.frame(lat = c(NaN, NaN), lon = c(NaN, NaN)))
    # mockery::stub(get_bridge_openings, 'get_bridge_openings', mock)
    # print(get_bridge_openings(fake_data = FALSE))
    # expect_false(is.nan(get_bridge_openings(fake_data = FALSE)))
    # Generate some mock data
    # m <- mockery::mock(12, NaN, 23)
    # expect_false(all(is.nan(m())))
    # expect_true(all(is.nan(m())))
    # expect_false(all(is.nan(m())))
  })
}

test_that("no duplicate data", {
  skip("Issue #142")
  df <- get_bridge_openings()
  expect_true(anyDuplicated(df) == 0)
})
