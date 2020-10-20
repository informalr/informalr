#' Subtract four numbers
#'
#' @param a A number
#' @return 4 from a subtracted
#' @examples
#' subtract_four_numbers(5)
#' @author Frans Bianchi
#' @export
subtract_four_numbers <- function(a) {
  if (is.numeric(a) == FALSE) {
    stop("Argument must be a number")
  }
  a - 4
}
