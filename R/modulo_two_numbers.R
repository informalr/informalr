#' Get the modulo of two numbers
#'
#' @param a A number
#' @param b A number
#' @return The modulo of \code{a} and \code{b}
#' @examples
#' modulo_two_numbers(4, 2)
#' modulo_two_numbers(10, 5)
#' @author Willy Tadema
#' @export
modulo_two_numbers <- function(a, b) {
  if (length(a) != 1) {
    stop("The first argument must be a number")
  } else if (!is.numeric(a) | is.na(a)) {
    stop("The first argument must be a number")
  } else if (length(b) != 1) {
    stop("The second argument must be a number")
  } else if (!is.numeric(b) | is.na(b)) {
    stop("The second argument must be a number")
  } else {
    a %% b
  }
}
