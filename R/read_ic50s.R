#' Read demo data
#'
#' Read the file in \code{inst/extdata}
#' with the demo data.
#'
#' @param filename The name of the file in
#' \code{inst/extdata} with the demo data
#' @return A dataframe with the demo data.
#' @export
#'
#' @examples
#' data <- read_ic50s()
read_ic50s <- function(filename = "2016-third-quarter-stolen-guns.csv") {
  full <- system.file("extdata", filename, package = "informalr")
  if (!file.exists(full)) {
    stop(paste0("File inst/extdata/", filename, " does not exist."))
  }
  data <- utils::read.csv(full, stringsAsFactors = FALSE)
  data$tool <- as.factor(data$Model)
  return(data)
}
