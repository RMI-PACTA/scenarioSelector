scenarioUI <- function(id) {
  tagList(pmap(inputs(id = id), select_column))
}

scenarioServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    pick_id <- function(data, id) {
      req(input[[id]])
      filter(data, .data[[id]] %in% input[[id]])
    }
    updateChoices <- function(reactive, inputId) {
      choices <- unique(reactive[[inputId]])
      updateSelectInput(inputId = inputId, choices = choices)
    }

    region <- reactive(pick_id(scenarioSelector::scenarios, "region"))
    observeEvent(region(), updateChoices(region(), "sector"))
    sector <- reactive(pick_id(region(), "sector"))
    observeEvent(sector(), updateChoices(sector(), "target"))
    target <- reactive(pick_id(sector(), "target"))
    observeEvent(target(), updateChoices(target(), "is_net0"))
    is_net0 <- reactive(pick_id(target(), "is_net0"))
    observeEvent(is_net0(), updateChoices(is_net0(), "is_2dii"))
    is_2dii <- reactive(pick_id(is_net0(), "is_2dii"))
    observeEvent(is_2dii(), updateChoices(is_2dii(), "variable"))
    variable <- reactive(pick_id(is_2dii(), "variable"))
    out <- variable
  })
}

scenarioApp <- function() {
  ui <- fluidPage(scenarioUI("id"))
  server <- function(input, output, session) scenarioServer("id")
  shinyApp(ui, server)
}
