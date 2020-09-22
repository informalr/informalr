#' Divide two numbers
#'
#' @param a A number
#' @param b A number
<<<<<<< HEAD
#' @return The result of the division of \code{a} and \code{b}
#' @examples
#' divide_two_numbers(4, 2)
#' divide_two_numbers(10, 5)
#' @author Stefano Tiso
#' @export
divide_two_numbers <- function(a, b) {
  stopifnot(is.numeric(a) & is.numeric(b))
=======
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
>>>>>>> develop
  a / b
}
