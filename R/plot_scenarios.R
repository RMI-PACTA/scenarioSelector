# https://mastering-shiny.org/scaling-functions.html#server-functions
plot_scenarios <- function(data) {
  p <- plot_panel(data)
  if (!all(is.na(data$technology))) {
    p <- p + facet_wrap(vars(.data$technology))
  }
  p
}

plot_panel <- function(data) {
  scenario_model <- interaction(data$scenario, data$model, sep = " | ")
  ggplot(data) +
    geom_line(aes(.data$year, .data$value, colour = scenario_model)) +
    labs(y = y_lab(data), colour = "scenario | model")
}

y_lab <- function(data) {
  unit <- unique(data$unit)
  unit <- ifelse(!is.na(unit), glue("[{unit}]"), "")
  paste(unique(data$variable), unit)
}
