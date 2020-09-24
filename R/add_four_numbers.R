#' Add up four numbers
#'
#' @param a A number
#' @param b A number
#' @param c A number
#' @param d A number
#' @return The sum of the three numbers
#' @examples
#' add_four_numbers(1, 2, 3, 4)
#' @author Claudio Tiecher
#' @export
add_four_numbers <- function(a, b, c, d) {
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
  if (is.na(d)) {
    stop("Fourth argument must be a number")
  }
  if (!is.numeric(d)) {
    stop("Fourth argument must be a number")
  }
  a + b + c + d
}
