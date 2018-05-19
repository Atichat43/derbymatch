#test class of model is svm from trainModel function
test_that("trainModel: class(model)", {
  model <- trainModel()
  c <- class(model)
  expect_that(c[1], is_identical_to("svm.formula"))
  expect_that(c[2], is_identical_to("svm"))
})

#test class of model is svm from Model function
test_that("Model: class(model)", {
  model <- Model()
  c <- class(model)
  expect_that(c[1], is_identical_to("svm.formula"))
  expect_that(c[2], is_identical_to("svm"))
})

#test model create from function Model is same with from trainModel
test_that("Is Model same as trainModel", {
  model <- Model()
  train_model <- trainModel()
  expect_that(model, equals(train_model))
})

