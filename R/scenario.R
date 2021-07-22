select_column <- function(id, name, choices, ...) {
  selectInput(NS(id, name), glue("Which `{name}`?"), choices)
}

scenarioUI <- function(id) {
  tagList(
    select_column(id, "region", unique(scenarioSelector::scenarios$region)),
    select_column(id, "sector", NULL),
    select_column(id, "variable", NULL),
    plotOutput(NS(id, "plot"))
  )
}

scenarioServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    region <- reactive({
      scenarioSelector::scenarios %>%
        filter(.data$region %in% input$region)
    })
    observeEvent(region(), {
      choices <- unique(region()$sector)
      updateSelectInput(inputId = "sector", choices = choices)
    })

    sector <- reactive({
      req(input$sector)
      filter(region(), sector == input$sector)
    })
    observeEvent(sector(), {
      choices <- unique(sector()$variable)
      updateSelectInput(inputId = "variable", choices = choices)
    })

    pick <- reactive({
      req(input$variable)
      filter(sector(), .data$variable == input$variable)
    })

    output$plot <- renderPlot({
      p <- ggplot(pick()) +
        geom_line(
          aes(
            .data$year,
            .data$value,
            colour = interaction(.data$scenario, .data$model, sep = " | ")
          )
        )

      unit <- unique(pick()$unit)
      unit <- ifelse(!is.na(unit), glue("[{unit}]"), "")
      y_lab <- paste(unique(input$variable), unit)
      p <- p +
        labs(y = y_lab, colour = "scenario | model")

      has_techs <- !unique(is.na(pick()$technology))
      # TODO: Avoid temporary error with req() or similar
      if (has_techs) {
        p <- p + facet_wrap(vars(.data$technology))
      }

      p
    })
  })
}

scenarioApp <- function() {
  ui <- fluidPage(scenarioUI("pick"))
  server <- function(input, output, session) scenarioServer("pick")
  shinyApp(ui, server)
}
