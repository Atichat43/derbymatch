#Predictor
LEVELS <- c('DRAW', 'WIN','LOSE')
#model <- Model()

predictMatch <- function(test_case){
  print(test_case)
  #result <- stats::predict(model, test_case)
  #return(LEVELS[as.numeric(result)])
}

tempTestCase <- function(dataset=getDataset()){
  test_case <- dataset[3, ]
  test_case <- subset(test_case, select = -c(away_team_api_id, home_team_api_id, result))
  test_case[1, ] <- 0
  return(test_case)
}

#========== for dev ========================
randomTestCase <- function(dataset=getDataset()){
  test_case <- dataset[sample((nrow(dataset)*0.7):nrow(dataset), 1), ]
  cat('Result For this test case:', test_case$result, '\n')
  test_case <- subset(test_case, select = -c(result))
  return(test_case)
}

testPredict <- function(){
  test_case <- tempTestCase()
  print(names(test_case))
  test_case$H_overall_rating = 1
  test_case$A_overall_rating = 1
  test_case$H_potential= 1
  test_case$A_potential= 1
  test_case$H_buildUpPlaySpeedClass= 1 #1
  test_case$H_buildUpPlayDribblingClass = 1
  test_case$H_buildUpPlayPassingClass= 1
  test_case$H_buildUpPlayPositioningClass= 1
  test_case$H_chanceCreationPassingClass = 1
  test_case$H_chanceCreationCrossingClass = 1
  test_case$H_chanceCreationShootingClass = 1
  test_case$H_defencePressureClass = 1
  test_case$H_defenceAggressionClass = 1
  test_case$H_defenceTeamWidthClass = 1
  test_case$H_chanceCreationPositioningClass = 1
  test_case$A_buildUpPlaySpeedClass= 1
  test_case$A_buildUpPlayDribblingClass= 1
  test_case$A_buildUpPlayPassingClass= 1
  test_case$A_buildUpPlayPositioningClass= 1 #4
  test_case$A_chanceCreationPassingClass = 1#5
  test_case$A_chanceCreationCrossingClass = 1 #6
  test_case$A_chanceCreationShootingClass = 1
  test_case$A_chanceCreationPositioningClass = 1
  test_case$A_defencePressureClass = 1
  test_case$A_defenceAggressionClass = 1
  test_case$A_defenceTeamWidthClass = 1
  
  
  # test_case$H_overall_rating = 1
  # test_case$A_overall_rating = 1
  # test_case$H_potential= 1
  # test_case$A_potential= 1
  # test_case$H_buildUpPlaySpeedClass= as.numeric(input$PlaySpeed) 
  # test_case$H_buildUpPlayDribblingClass = as.numeric(input$PlayDribbing)
  # test_case$H_buildUpPlayPassingClass= as.numeric(input$PlayPassing)
  # test_case$H_buildUpPlayPositioningClass= as.numeric(input$PlayPositioning)
  # test_case$H_chanceCreationPassingClass = as.numeric(input$ChanceCreationPassing)
  # test_case$H_chanceCreationCrossingClass = as.numeric(input$ChanceCreationCross)
  # test_case$H_chanceCreationShootingClass = as.numeric(input$ChanceCreationShooting)
  # test_case$H_defencePressureClass = as.numeric(input$DefencePressure)
  # test_case$H_defenceAggressionClass = as.numeric(input$DefenceAggretion)
  # test_case$H_defenceTeamWidthClass = as.numeric(input$DefenceTeamWidth)
  # test_case$H_chanceCreationPositioningClass = 1
  # test_case$A_buildUpPlaySpeedClass= as.numeric(input$PlaySpeed)
  # test_case$A_buildUpPlayDribblingClass= as.numeric(input$PlaySpeed)
  # test_case$A_buildUpPlayPassingClass= as.numeric(input$PlaySpeed)
  # test_case$A_buildUpPlayPositioningClass= as.numeric(input$PlaySpeed)
  # test_case$A_chanceCreationPassingClass = as.numeric(input$PlaySpeed)
  # test_case$A_chanceCreationCrossingClass = as.numeric(input$PlaySpeed)
  # test_case$A_chanceCreationShootingClass = as.numeric(input$PlaySpeed)
  # test_case$A_chanceCreationPositioningClass = as.numeric(input$PlaySpeed)
  # test_case$A_defencePressureClass = as.numeric(input$PlaySpeed)
  # test_case$A_defenceAggressionClass = as.numeric(input$PlaySpeed)
  # test_case$A_defenceTeamWidthClass = as.numeric(input$PlaySpeed)
  print(test_case)
  predictMatch(test_case)
}
