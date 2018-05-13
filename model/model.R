trainModel <- function(dataset=getDataset()) {
  svm_model <- e1071::svm(formula = result ~.,
                                data = dataset,
                                type = 'C-classification')
  return(svm_model)
}

Model <- function() {
  return(trainModel())
}
