#outcome: DRAW, WIN, LOSE in class of string
#outcome from predictMatch
getRandomTestCaseByOutcome <- function(outcome, number_of_case=100){
  if(!(outcome %in% array(c("WIN", "DRAW", "LOSE")))){
    return(NULL)
  }
  test_cases <- list()
  count = 1
  while(count != number_of_case){
    test_case <- randomTestCase()
    result <- predictMatch(test_case)
    if(result == outcome){
      test_cases[[count]] <- test_case
      count = count + 1
    }
  }
  return(test_cases)
}
###getRandomTestCaseByOutcome
#test all test case is all LOSE, WIN
test_that("getRandomTestCaseByOutcome: result follow outcome", {
  list_test_cases <- getRandomTestCaseByOutcome("WIN")
  for(test_case in list_test_cases){
    expect_that(predictMatch(as.data.frame(test_case)), equals("WIN"))
  }
  list_test_cases <- getRandomTestCaseByOutcome("DRAW")
  for(test_case in list_test_cases){
    expect_that(predictMatch(as.data.frame(test_case)), equals("DRAW"))
  }
  list_test_cases <- getRandomTestCaseByOutcome("LOSE")
  for(test_case in list_test_cases){
    expect_that(predictMatch(as.data.frame(test_case)), equals("LOSE"))
  }
})

getRandomTestCaseByN <- function(n=500){
  test_cases <- list()
  for(i in 1:n){
    test_cases[[i]] <- randomTestCase()
  }
  return(test_cases)
}

test_that("getRandomTestCaseByN: size return equals to input n", {
  #default
  test_cases <- getRandomTestCaseByN()
  expect_that(length(test_cases), equals(100))
  #input n
  for(n_element in c(1:10)){
    test_cases <- getRandomTestCaseByN(n_element)
    expect_that(length(test_cases), equals(n_element))
  }
})

getResultFromDfTestCase <- function(test_cases){
  count = 0
  outcome <- array()
  for(test_case in test_cases){
    count = count + 1
    outcome[count] <- predictMatch(as.data.frame(test_case))
  }
  return(outcome)
}

test_that("getResultFromDfTestCase: outcome match result of TestCase should be", {
  outcome <- getResultFromDfTestCase(getRandomTestCaseByOutcome("WIN"))
  expect_that(levels(factor(outcome)), equals("WIN"))
  outcome <- getResultFromDfTestCase(getRandomTestCaseByOutcome("LOSE"))
  expect_that(levels(factor(outcome)), equals("LOSE"))
  outcome <- getResultFromDfTestCase(getRandomTestCaseByOutcome("DRAW"))
  expect_that(levels(factor(outcome)), equals("DRAW"))
  outcome <- getResultFromDfTestCase(getRandomTestCaseByN())
  expect_that(length(levels(factor(outcome))) > 1, is_true())
})

######################################################################################3

## Test predictMatch
##Test tempTestCase
#names: test attr is suitable to be testcase for prediction
test_that("tempTestCase: #attr equals properly testcase", {
  temp_test_case <- tempTestCase()
  expect_that(length(names(temp_test_case)), equals(26))
  expect_that(temp_test_case$away_team_api_id, equals(NULL))
  expect_that(temp_test_case$home_team_api_id, equals(NULL))
  expect_that(temp_test_case$result, equals(NULL))
})

#predict: no error use this tempTestCase to predictMatch
test_that("tempTestCase: use tempTestCase with predictMatch", {
  str <- "WIN LOSE DRAW"
  for(i in 1:10){
    temp_test_case <- tempTestCase()
    expect_match(str, predictMatch(temp))
  }
})

#each element equals to 0
test_that("tempTestCase: each element equals to zero", {
  temp_test_case <- tempTestCase()
  for(i in 1:ncol(temp_test_case)){
    expect_equal(temp_test_case[, 1], 0)
  }
})

################################################################################

#check in fluence of overall rating
#lise_test_case: all test LOSE
#change away team overall rating = 0
#this function should return TRUE
# testInfluenceOverallRating <- function(list_test_cases){
#   overall_rating <- c(0, 1)
#   for(or in overall_rating){
#     # away team overall rating  = 0
#     for(test_case in list_test_cases){
#       test_case <- as.data.frame(list_test_cases)
#       test_case$A_overall_rating = or
#       result <- predictMatch(test_case)
#       if(result == "LOSE"){
#         print("A overall rating no influence to model")
#         return(FALSE)
#       }
#     }
#     
#     for(test_case in list_test_cases){
#       test_case <- as.data.frame(list_test_cases)
#       test_case$H_overall_rating = or
#       result <- predictMatch(test_case)
#       if(result == "LOSE"){
#         print("A overall rating no influence to model")
#         return(FALSE)
#       }
#     }
#   }
#   return(TRUE)
# }
# 
# testHomeShouldLose <- function(list_test_case){
#   outcomes <- array()
#   count <- 0
#   for(test_case in list_test_case){
#     count = count + 1
#     test_case <- as.data.frame(test_case)
#     test_case$H_overall_rating <- 2
#     test_case$H_potential <- 2
#     test_case$H_buildUpPlaySpeedClass <- 1
#     test_case$H_buildUpPlayDribblingClass <- 1
#     outcomes[count] <- predictMatch(test_case)
#   }
#   print(factor(outcomes))
# }
# 
# testHomeShouldWin <- function(list_test_case){
#   outcomes <- array()
#   count <- 0
#   for(test_case in list_test_case){
#     count = count + 1
#     test_case <- as.data.frame(test_case)
#     test_case$A_overall_rating <- 2
#     test_case$A_potential <- 2
#     test_case$A_buildUpPlaySpeedClass <- 1
#     test_case$A_buildUpPlayDribblingClass <- 1
#     outcomes[count] <- predictMatch(test_case)
#   }
#   print(factor(outcomes))
# }
# 
# testHomeShouldLose(getWinTestcase())
# testHomeShouldWin(getLoseTestcase())