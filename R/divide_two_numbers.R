#' Get the modulo of two numbers
#'
#' @param a A number
#' @param b A number
#' @return The result of the division of \code{a} and \code{b}
#' @examples
#' divide_two_numbers(4, 2)
#' divide_two_numbers(10, 5)
#' @author Stefano Tiso
#' @export
divide_two_numbers <- function(a, b) {
  stopifnot(is.numeric(a) & is.numeric(b))
  a / b
}
