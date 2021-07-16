# Source: https://git.io/JWove
fake_data <- function() {
  # styler: off
  out1 <- tibble::tribble(
    ~model,       ~scenario, ~year,
    "model_a", "scenario_a", 2021L,
    "model_a", "scenario_a", 2022L,
    "model_a", "scenario_a", 2023L,

    "model_a", "scenario_b", 2021L,
    "model_a", "scenario_b", 2022L,
    "model_a", "scenario_b", 2023L,

    "model_b", "scenario_a", 2021L,
    "model_b", "scenario_a", 2022L,
    "model_b", "scenario_a", 2023L,

    "model_b", "scenario_b", 2021L,
    "model_b", "scenario_b", 2022L,
    "model_b", "scenario_b", 2023L,
  )
  # styler: on

  out1$region <- "region_a"
  out2 <- out1
  out2$region <- "region_b"

  out <- rbind(out1, out2)
  out$variable <- "var_a"
  out$unit <- "gw"
  out$value <- runif(nrow(out))
  out$nuclear <- ifelse(out$scenario == "scenario_a", TRUE, FALSE)
  out
}
