scenarioUI <- function(id) {
  regions <- unique(fake_data()$region)
  tagList(
    selectInput(NS(id, "region"), "Which `region`?", regions),
    selectInput(NS(id, "nuclear"), "Has nuclear?", c("skip", "yes", "no")),
    plotOutput(NS(id, "plot"))
  )
}

scenarioServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    picked <- reactive({
      out <- fake_data()

      out <- out[out$region %in% input$region, ]

      out <- switch(input$nuclear,
        skip = out,
        yes = out[out$nuclear, ],
        no = out[!out$nuclear, ],
        stop("Unknown input: ", input$nuclear, call. = FALSE)
      )

      out
    })

    output$plot <- renderPlot({
      data <- picked()

      ggplot(data) +
        geom_line(aes(.data$year, .data$value)) +
        facet_grid(.data$model ~ .data$scenario) +
        labs(y = paste0(unique(data$variable), " [", unique(data$unit), "]"))
    })
  })
}

scenarioApp <- function() {
  ui <- fluidPage(scenarioUI("pick"))
  server <- function(input, output, session) scenarioServer("pick")
  shinyApp(ui, server)
}
