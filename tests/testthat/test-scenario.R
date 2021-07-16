test_that("if not considering nuclear outputs both kinds of scenarios", {
  testServer(scenarioServer, {
    session$setInputs(
      region = "region_a",
      consider_nuclear = "no",
      nuclear = "exclude"
    )
    expect_equal(sort(unique(picked()$nuclear)), sort(c(TRUE, FALSE)))
  })

  testServer(scenarioServer, {
    session$setInputs(
      region = "region_a",
      consider_nuclear = "no",
      nuclear = "inlcude"
    )
    expect_equal(sort(unique(picked()$nuclear)), sort(c(TRUE, FALSE)))
  })
})

test_that("if considering nuclear outputs is sensitive to include/exclude", {
  testServer(scenarioServer, {
    session$setInputs(
      region = "region_a",
      consider_nuclear = "yes",
      nuclear = "include"
    )
    expect_equal(unique(picked()$nuclear), TRUE)
  })

  testServer(scenarioServer, {
    session$setInputs(
      region = "region_a",
      consider_nuclear = "yes",
      nuclear = "exclude"
    )
    expect_equal(unique(picked()$nuclear), FALSE)
  })
})
