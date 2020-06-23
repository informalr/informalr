#' Divide two numbers
#'
#' @param a A number
#' @param b A number
#'
#' @return The division of number `a` by number `b`.
#' @export
#'
#' @examples
#' testthat::expect_equal(
#'   divide_two_numbers(a = 2, b = 5),
#'   0.4
#' )
#'
#' @author Pedro
divide_two_numbers <- function(a, b) {
  a / b
}
