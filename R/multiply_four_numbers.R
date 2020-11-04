#' Multiply four numbers
#'
#' @param a A number
#' @param b A number
#' @param c A number
#' @param d A number
#' @return The product of the four numbers
#' @examples
#' multiply_four_numbers(1, 2, 3, 4)
#' @author Alexine
#' @export
multiply_four_numbers <- function(a, b, c, d) {
  if (is.numeric(a) == FALSE || is.finite(a) == FALSE) {
    stop("First argument must be a number")
  }
  if (is.numeric(b) == FALSE) {
    stop("Second argument must be a number")
  }
  if (is.numeric(c) == FALSE) {
    stop("Third argument must be a number")
  }
  a * b * c * d
}
