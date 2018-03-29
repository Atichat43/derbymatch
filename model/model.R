trainModel <- function() {
  svm_model_e1071 <- e1071::svm(formula = result ~.,
                                data = getDataset(),
                                type = 'C-classification')
  return(svm_model_e1071)
}

Model <- function() {
  return(trainModel())
}
