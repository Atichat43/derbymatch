library(e1071) #Model: svm
library(shiny) #Ui: main
library(shinydashboard)
library(radarchart) #Ui: radar chart
#library(caret) # createFolds, createDataPartition

MANUNITED_API <- 10260

source('dataconnector.R')
source('controller.R')
source(file.path("model", "model.R"))
source(file.path("model", "predictor.R"))

real.roots <- function(a, b, c)
{
  if (a == 0.)
    stop("Leading term cannot be zero")
  
  d = b*b - 4*a*c # discriminant
  
  if (d < 0)
    rr = c()
  else if (d == 0)
    rr = c( -b/(2*a) )
  else
    rr = c( (-b - sqrt(d))/(2*a), 
            (-b + sqrt(d))/(2*a)  )
  
  return(rr)
}