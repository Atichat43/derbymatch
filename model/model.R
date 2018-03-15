#Model

#FOR RKEEL 
"
seperateDataset <- function(dataset, index_of_y=length(names(dataset)), percentage=0.75) {
  library(caret) 
  inTrain <- createDataPartition(y=dataset[,index_of_y], p=percentage, list=FALSE) 
  training_set <- dataset[inTrain, ] # training data set
  testing_set <- dataset[-inTrain, ]
 list(Train <- training_set, Test <- testing_set)
} #return value: list that [[1]] training_set, [[2]] testing_set


trainModel <- function(train_set, test_set) {
  library(RKEEL)
  mlp_bp_c_model <- MLP_BP_C(as.data.frame(train_set), as.data.frame(test_set), hidden_layers = 1, hidden_nodes = 41)
  mlp_bp_c_model$run()
  return(mlp_bp_c_model)
}
"
#FOR RSNNS with normlization
seperateDataset <- function(datasets) {
  library(RSNNS)
  datasets <- datasets[sample(1:nrow(datasets),length(1:nrow(datasets))),1:ncol(datasets)]
  
  datasetsValues <- datasets[,1:length(datasets)-1]
  datasetsTargets <- decodeClassLabels(datasets[,length(datasets)])
  
  datasets <- splitForTrainingAndTest(datasetsValues, datasetsTargets, ratio=0.15)
  datasets <- normTrainingAndTestSet(datasets)
  return(datasets)
}

preparingData <- function(filenames="dataset_numeric.csv") {
  datasets <- read.csv(file.path("datasets", "dataset_numeric.csv"))
  datasets <- seperateDataset(datasets)
}

datasets <- preparingData()


Model <- function() {
  model <- trainModel()
  return(model)
}

trainModel <- function(){
  model <- mlp(x = datasets$inputsTrain, y = datasets$targetsTrain, 
               inputsTest=datasets$inputsTest, targetsTest=datasets$targetsTest)
  return(model)
}