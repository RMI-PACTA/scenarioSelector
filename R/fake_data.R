fake_data <- function() {
  out <- tibble::tribble(
    ~model, ~scenario, ~region, ~variable, ~unit, ~year, ~value,
    "model_a", "scenario_a", "region_a", "a_a|b_b", "gw", 2021L, 1,
    "model_a", "scenario_a", "region_a", "a_a|b_b", "gw", 2022L, 2,
    "model_a", "scenario_a", "region_a", "a_a|b_b", "gw", 2023L, 1,
    "model_b", "scenario_a", "region_a", "a_a|b_b", "gw", 2021L, 1,
    "model_b", "scenario_a", "region_a", "a_a|b_b", "gw", 2022L, 2,
    "model_b", "scenario_a", "region_a", "a_a|b_b", "gw", 2023L, 2,
    "model_b", "scenario_b", "region_a", "a_a|b_b", "gw", 2021L, 1,
    "model_b", "scenario_b", "region_a", "a_a|b_b", "gw", 2022L, 2,
    "model_b", "scenario_b", "region_a", "a_a|b_b", "gw", 2023L, 3,
    "model_a", "scenario_b", "region_a", "a_a|b_b", "gw", 2021L, 1,
    "model_a", "scenario_b", "region_a", "a_a|b_b", "gw", 2022L, 2,
    "model_a", "scenario_b", "region_a", "a_a|b_b", "gw", 2023L, 4,
    "model_a", "scenario_a", "region_b", "a_a|b_b", "gw", 2021L, 2,
    "model_a", "scenario_a", "region_b", "a_a|b_b", "gw", 2022L, 2,
    "model_a", "scenario_a", "region_b", "a_a|b_b", "gw", 2023L, 1,
    "model_b", "scenario_a", "region_b", "a_a|b_b", "gw", 2021L, 2,
    "model_b", "scenario_a", "region_b", "a_a|b_b", "gw", 2022L, 2,
    "model_b", "scenario_a", "region_b", "a_a|b_b", "gw", 2023L, 2,
    "model_b", "scenario_b", "region_b", "a_a|b_b", "gw", 2021L, 2,
    "model_b", "scenario_b", "region_b", "a_a|b_b", "gw", 2022L, 2,
    "model_b", "scenario_b", "region_b", "a_a|b_b", "gw", 2023L, 3,
    "model_a", "scenario_b", "region_b", "a_a|b_b", "gw", 2021L, 2,
    "model_a", "scenario_b", "region_b", "a_a|b_b", "gw", 2022L, 2,
    "model_a", "scenario_b", "region_b", "a_a|b_b", "gw", 2023L, 4,
  )
  out$nuclear <- ifelse(out$scenario == "scenario_a", TRUE, FALSE)
  out
}
