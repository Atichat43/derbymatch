library(caTools)
set.seed(123)
split = sample.split(dataset$result, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

accuracy_array = c()
for (nTree in 1:2000){
  classifier = randomForest(x = training_set[-27],
                            y = training_set$result,
                            ntree = nTree)
  
  y_pred = predict(classifier, newdata = test_set[-27])
  cm = table(y_pred,test_set[,27])
  cm
  accuracy = (cm[1,1]+cm[2,2]+cm[3,3]) / (cm[1,1]+cm[1,2]+cm[1,3]+cm[2,1]+cm[2,2]+cm[2,3]+cm[3,1]+cm[3,2]+cm[3,3])
  accuracy
  accuracy_array = append(accuracy_array,accuracy)
}
summary(accuracy_array)