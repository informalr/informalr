#' Give the power of one number to the second one
#'
#' @param a A number
#' @param b A number
#' @return Number A to the power of number B
#' @examples
#' power_two_numbers(3, 4)
#' @author Jan Derk Kotlarski
#' @export
power_two_numbers <- function(a, b) {
  if (is.numeric(a) == FALSE) {
    stop("First argument must be a number")
  }
  if (!is.numeric(b)) {
    stop("Second argument must be a number")
  }
  a ^ b
}
