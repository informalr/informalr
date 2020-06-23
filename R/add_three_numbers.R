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
  if (is.na(a)) {
    stop("First argument must be a number")
  }
  if (!is.numeric(a)) {
    stop("First argument must be a number")
  }
  if (is.na(b)) {
    stop("Second argument must be a number")
  }
  if (!is.numeric(b)) {
    stop("Second argument must be a number")
  }
  if (is.na(c)) {
    stop("Third argument must be a number")
  }
  if (!is.numeric(c)) {
    stop("Third argument must be a number")
  }
  a + b + c
}
