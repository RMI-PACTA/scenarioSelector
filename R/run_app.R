#' scenarioSelector app
#'
#' @return Called for its side effect.
#' @export
#'
#' @examples
#' if (interactive()) {
#'   run_app()
#' }
run_app <- function() {
  ui <- fluidPage(
    sidebarPanel(scenarioUI("id")),
    mainPanel(plotOutput("plot"), dataTableOutput("table"))
  )
  server <- function(input, output, session) {
    scenarios <- scenarioServer("id")
    output$plot <- renderPlot(plot_scenarios(scenarios()))
    output$table <- renderDataTable(scenarios())
  }
  shinyApp(ui, server)
}
