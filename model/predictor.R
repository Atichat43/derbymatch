#Predictor
source(file.path("model", "model.R"))
model <- Model()

getResult <- function(model, testData){
  return("win")
}

#========== for dev ========================
"
getAccuracy <- function(model){
  t <- table(model$testPredictions)
  acc <- (t[1] + t[5] + t[9])/sum(t[1:9])
  return(acc)
}
"
getSummary <- function() {
  summary(model)
}

getAccuracy <- function(){
  predictions <- predict(model,datasets$inputsTest)
  t <- confusionMatrix(datasets$targetsTrain, fitted.values(model))
  accuracy(t)
  t2 <- confusionMatrix(datasets$targetsTest,predictions)
  accuracy(t2)
}

accuracy <- function(table){
  return((table[1] + table[5] + table[9])/sum(table[1:9]))
}

