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
    selectColumn("scenario"),
    selectColumn("region"),
    selectColumn("scenario_source"),

    plotOutput("tmsr"),
  )

  server <- function(input, output, session) {
    picked <- reactive({
      d <- dataset()
      d <- d[d$scenario %in% input$scenario, ]
      d <- d[d$region %in% input$region, ]
      d <- d[d$scenario_source %in% input$scenario_source, ]
      d
    })

    output$tmsr <- renderPlot({
      ggplot(picked()) +
        geom_line(aes(.data$year, .data$tmsr)) +
        facet_wrap(vars(.data$sector, .data$technology))
    })
  }

  shinyApp(ui, server)
}
