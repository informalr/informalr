#' Add up three numbers
#'
#' @param a A number
#' @param b A number
#' @param c A number
#' @return The sum of the three numbers
#' @examples
#' library(testthat)
#' expect_equal(6, add_three_numbers(1, 2, 3))
#' @author Anne-Kathrin Kleine
#' @export
add_three_numbers <- function(a, b, c) {
  a + b + c
}
