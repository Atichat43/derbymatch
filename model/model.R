trainModel <- function(dataset=getDataset()) {
  # for fast runner
  dataset <- subset(dataset, select = -c(away_team_api_id, home_team_api_id))
  svm_model <- e1071::svm(formula = result ~.,
                                data = dataset,
                                type = 'C-classification')
  return(svm_model)
}

SINGLETON_MODEL <- c("")
Model <- function() {
  SINGLETON_MODEL <<- trainModel()
}

getInstanceModel <- function(){
  return(SINGLETON_MODEL)
}
