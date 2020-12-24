#' Get real time bridge openings
#'
#' @export
#'
#' @examples
#' get_bridge_openings()
get_bridge_openings <- function() {
  informalr::get_coordinates(category = "bridges")
}
