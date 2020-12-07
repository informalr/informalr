#' Check the value of `show_bridge_openings`
#' @param show_bridge_openings character string indicating whether or not
#' bridge openings are plotted on top of the basemap.
#' @export
check_show_bridge_openings <- function(show_bridge_openings) {
  if (!(show_bridge_openings %in% c(TRUE, FALSE)) ||
      length(show_bridge_openings) != 1)
    stop("'show_bridge_openings' must be TRUE or FALSE")
}
