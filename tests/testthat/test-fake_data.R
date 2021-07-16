test_that("has the expected structure", {
  expect_s3_class(fake_data(), "data.frame")

  nms <- c("model", "scenario", "region", "variable", "unit", "year", "value")
  expect_true(all(nms %in% names(fake_data())))
})
