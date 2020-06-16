#' Get the modulo of two numbers
#'
#' @param a A number
#' @param b A number
#' @return The modulo of \code{a} and \code{b}
#' @examples
#' \dontrun{}
#' modulo_two_numbers(4, 2)
#' modulo_two_numbers(10, 5)
#' @author Willy Tadema
#' @export
modulo_two_numbers <- function(a, b) {
  stopifnot(is.numeric(a) & is.numeric(b))
  a %% b
}
