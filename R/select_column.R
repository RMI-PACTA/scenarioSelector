select_column <- function(id, name, choices = choices, label = name) {
  selectInput(NS(id, name), label = label, choices = choices)
}

choices <- function(scenarioSelector, scenarios) {
  out <- as.list(character(6))
  out[[1]] <- unique(scenarioSelector::scenarios$region)
  out
}
