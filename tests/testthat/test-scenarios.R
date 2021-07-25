test_that("outputs the expected snapshot", {
  expect_snapshot(scenarios)
})

test_that("has basic columns", {
  expect_equal(
    sort(names(scenarios)),
    sort(c(basic_names(), computed_names()))
  )
})

test_that("production `target` was computed correctly", {
  production_variable <- scenarios %>%
    distinct(variable, target) %>%
    filter(target == "production") %>%
    pull(variable)
  expect_equal(sort(production_variable), c("smsp", "tmsr"))
})

test_that("emission_factor `target` was computed correctly", {
  emission_factor_variable <- scenarios %>%
    distinct(variable, target) %>%
    filter(target == "emission_factor") %>%
    pull(variable)
  expect_equal(sort(emission_factor_variable), "emission_factor")
})

test_that("net0 `model` was computed correctly", {
  net0_model <- scenarios %>%
    distinct(model, is_net0) %>%
    filter(is_net0) %>%
    pull(model)

  expect_equal(sort(net0_model), c("isf_nz", "nze2021"))
})

test_that("2dii `model` was computed correctly", {
  twodii_model <- scenarios %>%
    distinct(model, is_2dii) %>%
    filter(is_2dii) %>%
    pull(model)

  expect_equal(sort(twodii_model), c("2ds", "b2ds", "isf_nz", "nze2021", "sds"))
})
