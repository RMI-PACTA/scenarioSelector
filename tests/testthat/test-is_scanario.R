test_that("is_production() detects production variables", {
  variable <- c("emission_factor", "smsp", "tmsr")
  expect_equal(is_production(variable), c(FALSE, TRUE, TRUE))
})

test_that("is_emission_factor() detects emission_factor variables", {
  variable <- c("emission_factor", "tmsr", "smsp")
  expect_equal(is_emission_factor(variable), c(TRUE, FALSE, FALSE))
})

test_that("is_production() plays well with dplyr::filter()", {
  out <- filter(scenarios, is_production(.data$variable))
  expect_false(identical(nrow(out), nrow(scenarios)))
  expect_equal(unique(out$variable), c("smsp", "tmsr"))
})

test_that("is_emission_factor() plays well with dplyr::filter()", {
  out <- filter(scenarios, is_emission_factor(.data$variable))
  expect_false(identical(nrow(out), nrow(scenarios)))
  expect_equal(unique(out$variable), "emission_factor")
})
