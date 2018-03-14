#Model
seperateDataset <- function(dataset, index_of_y=length(names(dataset)), percentage=0.75) {
  inTrain <- createDataPartition(y=dataset[,index_of_y], p=percentage, list=FALSE) 
  training_set <- dataset[inTrain, ] # training data set
  testing_set <- dataset[-inTrain, ]
 list(Train <- training_set, Test <- testing_set)
}

#[[1]] training_set, [[2]] testing_set

trainModel <- function(train_set, test_set) {
  mlp_bp_c_model <- MLP_BP_C(as.data.frame(train_set), as.data.frame(test_set), hidden_layers = 1, hidden_nodes = 41)
  mlp_bp_c_model$run()
  return(mlp_bp_c_model)
}

#pd <- mlp_bp_c_model$testPredictions
#table(pd)