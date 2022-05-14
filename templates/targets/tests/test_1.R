source("../R/function.R")

test_that("function works",{
  expect_equal(test_function(1,1), 2)
})
