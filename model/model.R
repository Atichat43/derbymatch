trainModel <- function(dataset=getDataset()) {
  # for fast runner
  dataset <- dataset[1:1000, ]
  dataset <- subset(dataset, select = -c(away_team_api_id, home_team_api_id))
  svm_model <- e1071::svm(formula = result ~.,
                                data = dataset,
                                type = 'C-classification')
  return(svm_model)
}

Model <- function() {
  return(trainModel())
}
