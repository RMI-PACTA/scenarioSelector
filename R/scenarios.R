#' Scenario datasets
#'
#' This dataset combines all scenarios available at <https://www.transitionmonitor.com/pacta-for-banks-2020/methodology-and-supporting-materials/>.
#' @examples
#' library(dplyr)
#'
#' # There are two kinds of scenarios:
#' production <- scenarios %>% filter(is_production(variable))
#' emission_factor <- scenarios %>% filter(is_emission_factor(variable))
#'
#' production %>% distinct(variable, value, unit)
"scenarios"

#' Columns in `scenarios`
#'
#' Help manipulate the `scenarios` dataset.
#'
#' @return `r class(scenario_columns())`
#' @export
#'
#' @examples
#' library(dplyr)
#'
#' scenarios %>%
#'   mutate(new = "Will be dropped in the next line") %>%
#'   select(!!!scenario_columns())
#'
#' scenarios %>%
#'   # Arrange a few rows randomly
#'   sample_n(5) %>%
#'   # Re-arrange rows as in `scenarios`
#'   arrange(!!!scenario_columns())
scenario_columns <- function() {
  dplyr::vars(
    .data$scenario,
    .data$model,
    .data$region,
    .data$year,
    .data$sector,
    .data$technology,
    .data$variable,
    .data$value,
    .data$unit
  )
}
