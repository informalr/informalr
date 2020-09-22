#' Subtract three numbers
#'
#' @param a A number
#' @return 3 from a subtracted
#' @examples
#' library(testthat)
#' expect_equal(2, subtract_three_numbers(5))
#' @author Geert van den Bogaart
#' @export
subtract_three_numbers <- function(a) {
  if (is.numeric(a) == FALSE) {
    stop("Argument must be a number")
  }
  a - 3
}
