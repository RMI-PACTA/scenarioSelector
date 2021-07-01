#' litigationRisk app
#'
#' @return Called for its side effect.
#' @export
#'
#' @examples
#' if (interactive()) {
#'  run_app()
#' }
run_app <- function() {
  ui <- fluidPage(
    "WIP"
  )

  server <- function(input, output, session) {

  }

  shinyApp(ui, server)
}
