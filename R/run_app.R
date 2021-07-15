#' litigationRisk app
#'
#' @return Called for its side effect.
#' @export
#'
#' @examples
#' if (interactive()) {
#'   run_app()
#' }
run_app <- function() {
  ui <- fluidPage(scenarioUI("id", c("scenario", "region", "scenario_source")))
  server <- function(input, output, session) scenarioServer("id")
  shinyApp(ui, server)
}
