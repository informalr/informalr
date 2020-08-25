#' Read demo data
#'
#' Read the \code{ic50s.csv} file in \code{inst/extdata}.
#'
#' @return A dataframe with the contents of the \code{ic50s.csv} file.
#' @export
#'
#' @examples
#' data <- read_ic50s()
read_ic50s <- function() {
  full <- system.file("extdata", "ic50s.csv", package = "informalr")
  if (!file.exists(full)) {
    stop("File inst/extdata/ic50s.csv does not exist.")
  }
  data <- utils::read.csv(full, stringsAsFactors = FALSE)
  data$tool <- as.factor(data$tool)
  return(data)
}
