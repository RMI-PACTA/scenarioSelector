#' Help manipulate the `scenarios` dataset.
#'
#' @examples
#' library(dplyr)
#'
#' identical(
#'   names(scenarios),
#'   c(basic_names(), computed_names())
#' )
#'
#' basic_vars()
#'
#' identical(
#'   names(basic_vars()),
#'   basic_names()
#' )
#'
#' scenarios %>%
#'   mutate(new = "Will be dropped in the next line") %>%
#'   select(!!!basic_vars())
#'
#' scenarios %>%
#'   # Arrange a few rows randomly
#'   sample_n(5) %>%
#'   # Re-arrange rows as in `scenarios`
#'   arrange(!!!basic_vars())
#' @noRd
basic_vars <- function() {
  symbol <- rlang::syms(basic_names())
  rlang::set_names(rlang::quos(!!!symbol), basic_names())
}

basic_names <- function() {
  c(
    "scenario",
    "model",
    "region",
    "year",
    "sector",
    "technology",
    "variable",
    "value",
    "unit"
  )
}

computed_names <- function() {
  c("is_net0", "is_2dii", "target")
}

production <- function() {
  c("smsp", "tmsr")
}

net0 <- function() {
  c("isf_nz", "nze2021")
}

twodii <- function() {
  sort(c(net0(), "2ds", "b2ds", "sds"))
}
