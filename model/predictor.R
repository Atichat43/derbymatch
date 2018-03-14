#Predictor
source(file.path("model", "model.R"))
m <- Model()

getResult <- function(model, testData){
  return("win")
}

#========== for dev ========================
getAccuracy <- function(model){
  t <- table(model$testPredictions)
  acc <- (t[1] + t[5] + t[9])/sum(t[1:9])
  return(acc)
}