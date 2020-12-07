#' Filter op aantal cylinders
#'
#' @param x
#'
#' @return
#' @export
filter_cars1 <- function(x) {
  mtcars[mtcars$cyl == x, ]
}

#' Filter op aantal carberateurs
#'
#' @param x
#'
#' @return
#' @export
filter_cars2 <- function(x) {
  mtcars[mtcars$carb == x, ]
}

#' Creeer dataframe
#'
#' @param x
#'
#' @return
#' @export
create_df <- function(x) {
  df <- informalr::filter_cars1(x)
  return(df)
}

#' Testje
#'
#' @return
#' @export
testje <- function() {
  mockery::stub(create_df, "informalr::filter_cars1", informalr::filter_cars2)
  create_df(2)
}

get_fake_data <- function(fake_data = TRUE) {
  data.frame(lat = 53.219167, lon = 6.568056)
}

testje2 <- function() {
  mockery::stub(create_map, "informalr::get_bridge_openings", get_fake_data)
  create_map("test2.png")
}
