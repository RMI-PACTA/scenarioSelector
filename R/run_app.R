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
    theme = theme_2dii(),
    sidebarPanel(scenarioUI("id")),
    mainPanel(plotOutput("plot"), dataTableOutput("table"))
  )
  server <- function(input, output, session) {
    thematic_shiny()

    scenarios <- scenarioServer("id")


    output$plot <- renderPlot(plot_scenarios(scenarios()), res = match_rs())

    output$table <- renderDataTable(scenarios())
  }
  shinyApp(ui, server)
}
