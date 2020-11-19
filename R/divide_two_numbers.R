#' Divide two numbers
#'
#' @param a A number
#' @param b A number
#' @return The result of the division of \code{a} and \code{b}
#' @examples
#' divide_two_numbers(4, 2)
#' divide_two_numbers(10, 5)
#' @author Stefano Tiso
#' @export
divide_two_numbers <- function(a, b) {

  if(is.character(a)){
    stop("The first argument is a character")
  }

  if(is.character(b)){
    stop("The second argument is a character")
    }

  if(is.na(a)){
    stop("The first argument is NA")
  }

  if(is.na(b)){
      stop("The second argument is NA")
    }

  if(is.null(a)){
    stop("The first argument is NULL")
  }

  if(is.null(b)){
    stop("The first argument is NULL")
  }

  if(is.infinite(a)){
    stop("The first argument is infinity")
  }

  if(is.infinite(b)){
    stop("The second argument is infinity")
  }

  if(b == 0){
    stop("Cannot divide by 0!")
  }

  a / b
}
