#' Help filter different kinds of scenarios
#'
#' @param x A vector.
#'
#' @return `r class(is_production("foo"))`
#' @export
#' @examples
#' library(dplyr, warn.conflicts = FALSE)
#'
#' filter(scenarios, is_production(variable))
#' filter(scenarios, is_emission_factor(variable))
is_production <- function(x) {
  x %in% c("smsp", "tmsr")
}

#' @rdname is_production
#' @export
is_emission_factor <- function(x) {
  x == "emission_factor"
}
