selectColumn <- function(name) {
  val <- unique(dataset()[[name]])
  selectInput(name, sprintf("Which `%s` would you like?", name), choices = val)
}
