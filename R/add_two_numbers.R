#' Add up two numbers
#'
#' @param a A number
#' @param b A number
#' @return The sum of the two numbers
#' @examples
#' library(testthat)
#' expect_equal(5, add_two_numbers(2, 3))
#' @author Richel Bilderbeek
#' @export
add_two_numbers <- function(a, b) {
  a + b
}
