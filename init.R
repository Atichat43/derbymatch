library(e1071) #Model: svm
library(shiny) #Ui: main
library(shinydashboard)
library(radarchart) #Ui: radar chart

MANUNITED_API <- 10260
HOME_TEAM_NAME <- 'Manchester United'

source('dataconnector.R')
source('controller.R')
source(file.path("model", "model.R"))
source(file.path("model", "predictor.R"))