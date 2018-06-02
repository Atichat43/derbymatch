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

getRandomTestCaseByOutcome2 <- function(outcome, number_of_case=5){
  if(!(outcome %in% array(c("WIN", "DRAW", "LOSE")))){
    return(NULL)
  }
  test_cases <- list()
  count = 1
  while(count != number_of_case){
    test_case <- randomTestCase2()
    home <- test_case$home_team_api_id
    tase_case <- subset(test_case, select=-c(home_team_api_id, away_team_api_id))
    result <- predictMatch(test_case)
    if(result == outcome){
      if(home == MANUNITED_API){
        test_cases[[count]] <- test_case
        count = count + 1
      }
    }
  }
  return(test_cases)
}

getRandomTestCaseByN <- function(n=500){
  test_cases <- list()
  for(i in 1:n){
    test_cases[[i]] <- randomTestCase()
  }
  return(test_cases)
}


getResultFromDfTestCase <- function(test_cases){
  count = 0
  outcome <- array()
  for(test_case in test_cases){
    count = count + 1
    outcome[count] <- predictMatch(as.data.frame(test_case))
  }
  return(outcome)
}