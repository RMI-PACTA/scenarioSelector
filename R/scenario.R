scenarioUI <- function(id) {
  nuclear_tabs <- tabsetPanel(
    id = NS(id, "nuclear_question"),
    type = "hidden",
    tabPanel("no"),
    tabPanel("yes", selectInput(
      NS(id, "nuclear"),
      "Include or exclude nuclear energy?", c("include", "exclude")
    ))
  )

  regions <- unique(fake_data()$region)
  tagList(
    selectInput(NS(id, "region"), "Which `region`?", regions),
    selectInput(
      NS(id, "consider_nuclear"), "Consider nuclear?",
      choices = c("no", "yes"), selected = "no"
    ),
    nuclear_tabs,
    plotOutput(NS(id, "plot"))
  )
}

scenarioServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$consider_nuclear, {
      updateTabsetPanel(
        inputId = "nuclear_question", selected = input$consider_nuclear
      )
    })

    picked <- reactive({
      out <- fake_data()

      out <- out[out$region %in% input$region, ]

      if (input$consider_nuclear == "yes") {
        out <- switch(input$nuclear,
          include = out[out$nuclear, ],
          exclude = out[!out$nuclear, ]
        )
      }

      out
    })

    output$plot <- renderPlot({
      data <- picked()

      ggplot(data) +
        geom_line(
          aes(
            .data$year,
            .data$value,
            colour = interaction(.data$model, .data$scenario, sep = " + ")
          )
        ) +
        labs(
          y = paste(unique(data$variable), "[", unique(data$unit), "]"),
          colour = "model + scenario"
        )
    })
  })
}

scenarioApp <- function() {
  ui <- fluidPage(scenarioUI("pick"))
  server <- function(input, output, session) scenarioServer("pick")
  shinyApp(ui, server)
}
