#' Check png filename
#'
#'
#'
#' @param png_filename name of the PNG that the map will be saved to
#'
#' @author Alexine de Wit
#'
#' @export
check_png_filename <- function(png_filename) {
  if (is.numeric(png_filename) || is.na(png_filename) ||
      is.null(png_filename) || length(png_filename) != 1)
    stop("'png_filename' must be one word")
}
