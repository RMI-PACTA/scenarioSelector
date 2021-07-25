plot_scenarios <- function(data) {
  p <- ggplot(data) +
    geom_line(
      aes(
        .data$year,
        .data$value,
        colour = interaction(.data$scenario, .data$model, sep = " | ")
      )
    ) +
    labs(y = y_lab(data), colour = "scenario | model")

  has_some_technology <- !unique(is.na(data$technology))
  if (has_some_technology) {
    p <- p + facet_wrap(vars(.data$technology))
  }

  p
}

y_lab <- function(data) {
  unit <- unique(data$unit)
  unit <- ifelse(!is.na(unit), glue("[{unit}]"), "")
  paste(unique(data$variable), unit)
}
