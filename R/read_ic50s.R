#' Read demo data
#'
#' Read the \code{2016-third-quarter-stolen-guns.csv} file
#' in \code{inst/extdata}.
#'
#' @return A dataframe with the contents of the
#' \code{2016-third-quarter-stolen-guns.csv} file.
#' @export
#'
#' @examples
#' data <- read_ic50s()
read_ic50s <- function() {
  filename <- "2016-third-quarter-stolen-guns.csv"
  full <- system.file("extdata", filename, package = "informalr")
  if (!file.exists(full)) {
    stop("File inst/extdata/2016-third-quarter-stolen-guns.csv does not exist.")
  }
  data <- utils::read.csv(full, stringsAsFactors = FALSE)
  data$tool <- as.factor(data$Model)
  return(data)
}
