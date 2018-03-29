#Predictor
LEVELS <- c('draw', 'win','lose')
model <- Model()

predictNextMatch <- function(test_case){
  result <- predict(model, test_case)
  return(LEVELS[as.numeric(result)])
}

#========== for dev ========================
randomTestCase <- function(){
  test_case <- getDataset()
  test_case <- test_case[sample((nrow(test_case)*0.7):nrow(test_case), 1), ]
  print('Result For this test case:')
  print(test_case$result)
  test_case <- subset(test_case, select = -c(result))
  return(test_case)
}


