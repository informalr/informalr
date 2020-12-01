#' Check the value of `show_bridge_openings`
#' @param show_bridge_openings character string indicating whether or not
#' bridge openings are plotted on top of the basemap.
#' @export
check_show_bridge_openings <- function(show_bridge_openings) {
  # %not_in% returns whether an element is not in a vector
  "%not_in%" <- Negate("%in%")

  if (!is.character(show_bridge_openings) ||
      show_bridge_openings %not_in% c("yes", "no", "fake") ||
      length(show_bridge_openings) != 1)
    stop("'show_bridge_openings' must be 'yes', 'no' or 'fake'")
}
