library(e1071) # RPART, mlbench(ZOO)
library(caret) # createFolds, createDataPartition
library(shiny)
library(shinydashboard)
library(radarchart)

source('dataconnector.R')
source(file.path("functions", "functions.R"))
source(file.path("model", "model.R"))
source(file.path("model", "predictor.R"))