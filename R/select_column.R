select_column <- function(id, name, choices, label) {
  selectInput(NS(id, name), label = label, choices = choices)
}

# styler: off
selector_arguments <- function() {
  out <- tibble::tribble(
         ~name,                                 ~label,
      "region",   "Which region do you want to study?",
      "sector",   "Which sector do you want to study?",
      "target",   "Which target do you want to study?",
     "is_net0",              "Pick net-0 models only?",
     "is_2dii",       "Pick 2DII-aligned models only?",
    "variable", "Which variable do you want to study?",
  )
  out$choices <- choices()
  out
}
# styler: on

choices <- function() {
  out <- as.list(character(6))
  out[[1]] <- unique(scenarioSelector::scenarios$region)
  out
}
