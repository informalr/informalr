#' Create a map
#'
#' Creates a map with the desired hiking info.
#' The map is saved as a PNG file.
#' @param png_filename name of the PNG that the map will be saved to
#' @export
create_map <- function(png_filename) {
  # Stub: just copy a file
  file.copy(
    from = system.file(
      "extdata",
      "map.png",
      package = "informalr"
    ),
    to = png_filename
  )
}
