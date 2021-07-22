test_that("uses `scenarios` data", {
  testServer(scenarioServer, {
    session$setInputs(
      region = unique(scenarios$region)[[1]],
      sector = unique(scenarios$sector)[[1]],
      technology = unique(scenarios$technology)[[1]],
      variable = unique(scenarios$variable)[[1]]
    )
    expect_equal(sort(names(pick())), sort(names(scenarios)))
  })
})

test_that("plots a single region", {
  testServer(scenarioServer, {
    session$setInputs(
      region = unique(scenarios$region)[[1]],
      sector = unique(scenarios$sector)[[1]],
      technology = unique(scenarios$technology)[[1]],
      variable = unique(scenarios$variable)[[1]]
    )
    expect_length(unique(pick()$region), 1L)
  })
})

test_that("plots a single sector", {
  testServer(scenarioServer, {
    session$setInputs(
      region = unique(scenarios$region)[[1]],
      sector = unique(scenarios$sector)[[1]],
      technology = unique(scenarios$technology)[[1]],
      variable = unique(scenarios$variable)[[1]]
    )
    expect_length(unique(pick()$sector), 1L)
  })
})

test_that("plots a single variable", {
  testServer(scenarioServer, {
    session$setInputs(
      region = unique(scenarios$region)[[1]],
      sector = unique(scenarios$sector)[[1]],
      technology = unique(scenarios$technology)[[1]],
      variable = unique(scenarios$variable)[[1]]
    )
    expect_length(unique(pick()$variable), 1L)
  })
})
