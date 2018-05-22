#Predictor
LEVELS <- c('DRAW', 'WIN','LOSE') #DRAW 1, #WIN 2, #LOSE 3 
model <- Model()

predictMatch <- function(test_case){
  print(test_case[, 1:2])
  print(test_case$H_buildUpPlaySpeedClass)
  print(test_case$H_buildUpPlayDribblingClass)
  print(test_case[, 3:4])
  print(test_case$A_buildUpPlaySpeedClass)
  print(test_case$A_buildUpPlayDribblingClass)
  result <- stats::predict(model, test_case)
  return(LEVELS[as.numeric(result)])
}
#test predictMatch


tempTestCase <- function(dataset=getDataset()){
  test_case <- dataset[3, ]
  test_case <- subset(test_case, select = -c(away_team_api_id, home_team_api_id, result))
  test_case[1, ] <- 0
  return(test_case)
}

#========== for dev ========================
randomTestCase <- function(dataset=getDataset()){
  test_case <- dataset[sample((nrow(dataset)*0.7):nrow(dataset), 1), ]
  test_case <- subset(test_case, select = -c(away_team_api_id, home_team_api_id, result))
  return(test_case)
}