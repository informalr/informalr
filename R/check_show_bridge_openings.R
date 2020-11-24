#' Check the value of `show_bridge_openings`
#' @param show_bridge_openings character string indicating whether or not
#' bridge openings are plotted on top of the basemap.
#' @export
check_show_bridge_openings <- function(show_bridge_openings) {
  "%ni%" <- Negate("%in%")
  if (!is.character(show_bridge_openings) ||
      show_bridge_openings %ni% c("yes", "no", "fake") ||
      length(show_bridge_openings) != 1)
    stop("'show_bridge_openings' must be 'yes', 'no' or 'fake'")
}
