scenarioUI <- function(id, cols) {
  tagList(
    lapply(cols, select_from, id),
    plotOutput(NS(id, "tmsr"))
  )
}

scenarioServer <- function(id) {
  moduleServer(id, function(input, output, session) {
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
  })
}

pickApp <- function() {
  cols <- c("scenario", "region", "scenario_source")
  ui <- fluidPage(scenarioUI("pick", cols))
  server <- function(input, output, session) scenarioServer("pick")
  shinyApp(ui, server)
}

select_from <- function(name, id) {
  val <- unique(dataset()[[name]])
  selectInput(
    NS(id, name), sprintf("Which `%s` would you like?", name),
    choices = val
  )
}
