test_that("Distinct roots", {
  
  roots <- real.roots(1, 7, 12)
  
  expect_that( roots, is_a("numeric") )
  expect_that( length(roots), equals(2) )
  expect_that( roots[1] < roots[2], is_true() )
})

test_that("Polynomial must be quadratic", {
  
  # Test for ANY error                     
  expect_that( real.roots(0, 2, 3), throws_error() )
  
  # Test specifically for an error string containing "zero"
  expect_that( real.roots(0, 2, 3), throws_error("zero") )
  
  # Test specifically for an error string containing "zero" or "Zero" using regular expression
  expect_that( real.roots(0, 2, 3), throws_error("[zZ]ero") )
# })
})

