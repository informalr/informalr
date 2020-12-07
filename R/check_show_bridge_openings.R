#' Check the value of `show_bridge_openings`
#' @param show_bridge_openings character string indicating whether or not
#' bridge openings are plotted on top of the basemap.
#' @export
check_show_bridge_openings <- function(show_bridge_openings) {
  if (!is.logical(show_bridge_openings) ||
      length(show_bridge_openings) != 1 ||
      is.na(show_bridge_openings))
    stop("'show_bridge_openings' must be TRUE or FALSE")
}
