#' Check the value of `show_bridge_openings`
#' @param show_bridge_openings character string indicating whether or not
#' bridge openings are plotted on top of the basemap.
#' @export
check_show_bridge_openings <- function(a) {
  if (!is.logical(a) || length(a) != 1 || is.na(a))
    stop("'show_bridge_openings' must be TRUE or FALSE")
}
