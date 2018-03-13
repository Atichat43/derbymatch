library(e1071) # RPART, mlbench(ZOO)
library(caret) # createFolds, createDataPartition
library(doParallel) # for r faster
registerDoParallel()

library(shiny)

#loading data
players <- read.csv("./datasets/ManU_player.csv")