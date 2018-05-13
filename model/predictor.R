#Predictor
LEVELS <- c('DRAW', 'WIN','LOSE')
model <- Model()

predictMatch <- function(test_case){
  result <- stats::predict(model, test_case)
  return(LEVELS[as.numeric(result)])
}

#========== for dev ========================
randomTestCase <- function(dataset=getDataset()){
  test_case <- dataset[sample((nrow(dataset)*0.7):nrow(dataset), 1), ]
  cat('Result For this test case:', test_case$result, '\n')
  test_case <- subset(test_case, select = -c(result))
  return(test_case)
}


