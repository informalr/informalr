#' Divide 3 numbers
#'
#' @param a A number
#' @param b A number
#' @param c A number
#' @return The division of 3 numbers
#' @examples
#' library(testthat)
#' expect_equal(1, divide_three_numbers((10, 5, 2))
#' @author lizzie
#' @export
divide_three_numbers <- function(a, b, c) {
  (a / b) / c
}
