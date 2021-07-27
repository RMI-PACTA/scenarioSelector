# https://mastering-shiny.org/scaling-testing.html#testing-reactivity
test_that("reacts to emission_factor selections", {
  testServer(scenarioServer, {
    session$setInputs(
      region = "global",
      sector = "cement",
      target = "emission_factor",
      is_net0 = "FALSE",
      is_2dii = "TRUE",
      variable = "emission_factor"
    )

    expect_equal(unique(out()$region), "global")
    expect_equal(unique(out()$sector), "cement")
    expect_equal(unique(out()$target), "emission_factor")
    expect_equal(unique(out()$is_net0), FALSE)
    expect_equal(unique(out()$is_2dii), TRUE)
    expect_equal(unique(out()$variable), "emission_factor")
  })
})

test_that("reacts to production selections", {
  testServer(scenarioServer, {
    session$setInputs(
      region = "global",
      sector = "automotive",
      target = "production",
      is_net0 = "FALSE",
      is_2dii = "FALSE",
      variable = "tmsr"
    )

    expect_equal(unique(out()$region), "global")
    expect_equal(unique(out()$sector), "automotive")
    expect_equal(unique(out()$target), "production")
    expect_equal(unique(out()$is_net0), FALSE)
    expect_equal(unique(out()$is_2dii), FALSE)
    expect_equal(unique(out()$variable), "tmsr")
  })
})
