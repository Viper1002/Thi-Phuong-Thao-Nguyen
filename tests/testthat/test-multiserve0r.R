test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
library(testthat)
library(praiseme)

test_that("Multiserver outputs correct structure", {
  set.seed(2048)
  arrival <- cumsum(rexp(10, 1/60))
  service <- rexp(10, 1/150) + 20
  result <- Multiserver(arrival, service, 2)
  expect_equal(ncol(result), 4)
  expect_named(result, c("Arrivals", "ServiceBegins", "ChosenServer", "ServiceEnds"))
})

test_that("Multiserver handles zero customers", {
  result <- Multiserver(numeric(0), numeric(0), 2)
  expect_equal(nrow(result), 0)
})
devtools::test()
