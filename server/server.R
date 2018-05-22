##############################################################################################
#render tactic OUR TEAM
#global number of players 
observeEvent(input$opponent_select, {
  away_team_apis <- toStringApiPlayers(getPlayers(input$opponent_select))
  away_team_api_list_check <<- away_team_apis[1:11]
})

output$number_of_players_home <- renderText({paste("number of player",length(input$HomePlayerGroup))})
output$number_of_players_away <- renderText({paste("number of player",length(input$AwayPlayerGroup))})

apis <- toStringApiPlayers(getPlayers(HOME_TEAM_NAME))[1:11]
h_overall_potential <- getOverallRatingPotential(HOME_TEAM_NAME, apis)

observeEvent(input$bt_predict, {
  if(length(away_team_api_list_check) != 11 || length(home_team_api_list_check) != 11){
    showNotification("Please select 11 players (Away team & Home team).", type='warning', duration=2)
    output$predict_result <- renderUI({ h3('Cicked Button', style='text-align:center;')})
    return()
  }
  test_case <- tempTestCase()
  if(!is.null(home_team_api_list_check)){
    h_overall_potential <<- getOverallRatingPotential(HOME_TEAM_NAME, as.array(home_team_api_list_check))
  }
  test_case$H_overall_rating = h_overall_potential[1]
  test_case$H_potential= h_overall_potential[2]
  a_overall_potential <- getOverallRatingPotential(input$opponent_select, as.array(away_team_api_list_check))
  test_case$A_overall_rating = a_overall_potential[1]
  test_case$A_potential= a_overall_potential[2]
  test_case$H_buildUpPlaySpeedClass= as.numeric(input$H_buildUpPlaySpeedClass)
  test_case$H_buildUpPlayDribblingClass = as.numeric(input$H_buildUpPlayDribblingClass)
  test_case$H_buildUpPlayPassingClass= as.numeric(input$H_buildUpPlayPassingClass)
  test_case$H_buildUpPlayPositioningClass= as.numeric(input$H_buildUpPlayPositioningClass)
  test_case$H_chanceCreationPassingClass = as.numeric(input$H_chanceCreationPassingClass)
  test_case$H_chanceCreationCrossingClass = as.numeric(input$H_chanceCreationCrossingClass)
  test_case$H_chanceCreationShootingClass = as.numeric(input$H_chanceCreationShootingClass)
  test_case$H_defencePressureClass = as.numeric(input$H_defencePressureClass)
  test_case$H_defenceAggressionClass = as.numeric(input$H_defenceAggressionClass)
  test_case$H_defenceTeamWidthClass = as.numeric(input$H_defenceTeamWidthClass)
  test_case$H_chanceCreationPositioningClass = as.numeric(input$H_chanceCreationPositioningClass)
  # #######################################################################################
  if(is.null(input$A_buildUpPlaySpeedClass)){
    tactic <- getTactic(getTeamApi(input$opponent_select))
    test_case$A_buildUpPlaySpeedClass= as.numeric(tactic$PlaySpeed)
    test_case$A_buildUpPlayDribblingClass = as.numeric(tactic$PlayDribbling)
    test_case$A_buildUpPlayPassingClass= as.numeric(tactic$PlayPassing)
    test_case$A_buildUpPlayPositioningClass= as.numeric(tactic$PlayPositioning)
    test_case$A_chanceCreationPassingClass = as.numeric(tactic$Passing)
    test_case$A_chanceCreationCrossingClass = as.numeric(tactic$Crossing)
    test_case$A_chanceCreationShootingClass = as.numeric(tactic$Shooting)
    test_case$A_defencePressureClass = as.numeric(tactic$Pressure)
    test_case$A_defenceAggressionClass = as.numeric(tactic$Aggression)
    test_case$A_defenceTeamWidthClass = as.numeric(tactic$TeamWidth)
    test_case$A_chanceCreationPositioningClass = as.numeric(tactic$Positioning)
  }
  else{
    test_case$A_buildUpPlaySpeedClass= as.numeric(input$A_buildUpPlaySpeedClass)
    test_case$A_buildUpPlayDribblingClass = as.numeric(input$A_buildUpPlayDribblingClass)
    test_case$A_buildUpPlayPassingClass= as.numeric(input$A_buildUpPlayPassingClass)
    test_case$A_buildUpPlayPositioningClass= as.numeric(input$A_buildUpPlayPositioningClass)
    test_case$A_chanceCreationPassingClass = as.numeric(input$A_chanceCreationPassingClass)
    test_case$A_chanceCreationCrossingClass = as.numeric(input$A_chanceCreationCrossingClass)
    test_case$A_chanceCreationShootingClass = as.numeric(input$A_chanceCreationShootingClass)
    test_case$A_defencePressureClass = as.numeric(input$A_defencePressureClass)
    test_case$A_defenceAggressionClass = as.numeric(input$A_defenceAggressionClass)
    test_case$A_defenceTeamWidthClass = as.numeric(input$A_defenceTeamWidthClass)
    test_case$A_chanceCreationPositioningClass = as.numeric(input$A_chanceCreationPositioningClass)
  }
  print("********************************")
  print(input$opponent_select)
  result <- predictMatch(test_case)
  print(result)
  print("---------------------------------")
  output$predict_result <- renderUI({
                              if(as.character(result) == 'WIN'){
                                h1('WIN', style='text-align:center;
                                                  background-color: green;
                                                  color:#fff')
                              }
                              else if(as.character(result) == 'DRAW'){
                                h1('DRAW', style='text-align:center;
                                                  background-color: gray;')
                              }
                              else if(as.character(result) == 'LOSE'){
                                h1('LOSE', style='text-align:center;
                                                  background-color: red;')
                              }
                              else{
                                h1('')
                              }
                            })
})

output$predict_result <- renderUI({
  h3('Cicked Button', style='text-align:center;')
})


#generate tactic for away team  
output$select_input_Away <- renderUI({
  tactic <- getTactic(getTeamApi(input$opponent_select))  #Controller:: getTactic getTeamApi
  tagList(title = h3("Away Tactic"),
    hr(class='my-4'),
    selectInput("A_buildUpPlaySpeedClass", label = h5("PlaySpeed"), 
                choices = list("Balance" = 1, "Fast" = 2, "Slow" = 3), 
                selected = tactic$PlaySpeed),
    
    selectInput("A_buildUpPlayDribblingClass", label = h5("PlayDribbling"), 
                choices = list("Little" = 1, "Normal" = 2),
                selected = tactic$PlayDribbling),
    
    selectInput("A_buildUpPlayPassingClass", label = h5("playPassing"), 
                choices = list("Long" = 1, "Mixed" = 2, "Short" = 3), 
                selected = tactic$PlayPassing),
    
    selectInput("A_buildUpPlayPositioningClass", label = h5("PlayPositioning"), 
                choices = list("Free Form" = 1, "Organised" = 2),
                selected = tactic$PlayPositioning),
    
    selectInput("A_chanceCreationPassingClass", label = h5("ChanceCreationPassing"), 
                choices = list("Normal" = 1, "Risky" = 2, "Safe" = 3), 
                selected = tactic$Passing)
  )
})

output$select_input_Away2 <- renderUI({
  tactic <- getTactic(getTeamApi(input$opponent_select))   #Controller:: getTactic getTeamApi
  tagList(
    hr(class='my-2'),
    selectInput("A_chanceCreationCrossingClass", label = h5("ChanceCreationCross"), 
                choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                selected = tactic$Crossing),
    
    selectInput("A_chanceCreationShootingClass", label = h5("ChanceCreationShooting"), 
                choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                selected = tactic$Shooting),
    
    selectInput("A_chanceCreationPositioningClass", label = h5("ChanceCreationPosition"), 
                choices = list("Free Form" = 1, "Organised" = 2), 
                selected = tactic$Positioning),
    
    selectInput("A_defencePressureClass", label = h5("DefencePressure"), 
                choices = list("Deep" = 1, "High" = 2, "Medium" = 3), 
                selected = tactic$Pressure),
    
    selectInput("A_defenceAggressionClass", label = h5("DefenceAggression"), 
                choices = list("Contain" = 1, "Double" = 2, "Press" = 3), 
                selected = tactic$Aggression),
    
    selectInput("A_defenceTeamWidthClass", label = h5("DefenceTeamWidth"), 
                choices = list("Narrow" = 1, "Normal" = 2, "Wide" = 3), 
                selected = tactic$TeamWidth)
  )
})

#####################################################################################################
#render tactic Away Team
#global var
home_team_players <- toStringPlayersChoices(getPlayers("Manchester United")) #toStringPlayersChoices, getPlayers
home_team_apis <- toStringApiPlayers(getPlayers("Manchester United"))
home_team_api_list_check <- home_team_apis[1:11]

away_team_api_list_check <- NULL
##########################################################################################################
##########################################################################################################
#ui home player
output$Homeplayer<- renderUI({
  checkboxGroupInput("HomePlayerGroup", label = h5("Manchester United's Player"), 
                     choiceNames = home_team_players,
                     choiceValues = home_team_apis,
                     selected = home_team_api_list_check
  )
})

observeEvent(input$HomePlayerGroup, {
  if(length(input$HomePlayerGroup) > 11){
    showNotification("Please select 11 players only.", type='warning', duration=2)
    updateCheckboxGroupInput(session=session,
                             inputId = "HomePlayerGroup", 
                             choiceNames = home_team_players,
                             choiceValues = home_team_apis,
                             selected = home_team_api_list_check)
  }
  else{
    home_team_api_list_check <<- input$HomePlayerGroup
  }
}, ignoreNULL = FALSE)

#ui away player
output$Awayplayer <- renderUI({
  away_team_players <- toStringPlayersChoices(getPlayers(input$opponent_select)) #toStringPlayersChoices, getPlayers
  away_team_apis <- toStringApiPlayers(getPlayers(input$opponent_select))  #getPlayers, toStringApiPlayers
  tempText <- paste(input$opponent_select,"'s Player")
  checkboxGroupInput("AwayPlayerGroup", label = h5(tempText), 
                     choiceNames = away_team_players,
                     choiceValues = away_team_apis,
                     selected = away_team_api_list_check
  )
})

observeEvent(input$AwayPlayerGroup, {
  if(length(input$AwayPlayerGroup) > 11){
    showNotification("Please select 11 players only.", type='warning', duration=2)
    away_team_players <- toStringPlayersChoices(getPlayers(input$opponent_select)) #toStringPlayersChoices, getPlayers
    away_team_apis <- toStringApiPlayers(getPlayers(input$opponent_select))  #getPlayers, toStringApiPlayers
    updateCheckboxGroupInput(session=session,
                             inputId = "AwayPlayerGroup", 
                             choiceNames = away_team_players,
                             choiceValues = away_team_apis,
                             selected = away_team_api_list_check)
  }
  else if(length(input$AwayPlayerGroup) > 0){
    away_team_api_list_check <<- input$AwayPlayerGroup
  }
  else if(length(input$AwayPlayerGroup) == 0){
    away_team_apis <- toStringApiPlayers(getPlayers(input$opponent_select))
    away_team_api_list_check <<- away_team_apis[1:11]
  }
  else{}
}, ignoreNULL = FALSE)


##########################################################################################################
##########################################################################################################
#SUMMARY
output$selected_Hplayers <- renderUI({
  playerlist <- toStringPlayersChoices(getPlayers("Manchester United", input$HomePlayerGroup))  #toStringPlayersChoices, getPlayers
  radioButtons("rbH_players", "Choose one:",
               choiceNames = playerlist,
               choiceValues = input$HomePlayerGroup)
})

output$selected_Aplayers <- renderUI({
  if(is.null(input$AwayPlayerGroup)){
    away_team_apis <- toStringApiPlayers(getPlayers(input$opponent_select))
    away_team_apis <- away_team_apis[1:11]
    playerlist <- toStringPlayersChoices(getPlayers(input$opponent_select, away_team_apis)) #toStringPlayersChoices, getPlayers
    radioButtons("rbA_players", "Choose one:",
                 choiceNames = playerlist,
                 choiceValues = away_team_apis)
  }
  else{
    playerlist <- toStringPlayersChoices(getPlayers(input$opponent_select, input$AwayPlayerGroup)) #toStringPlayersChoices, getPlayers
    radioButtons("rbA_players", "Choose one:",
                 choiceNames = playerlist,
                 choiceValues = input$AwayPlayerGroup)
  }
})

#Radar Chart
output$radar<- renderChartJSRadar({
  p1 <- getPlayerStat("Manchester United", input$rbH_players)  #getPlayerStat
  if(is.null(input$rbA_players)){
    h2('Loading...')
  }
  else{
    p2 <- getPlayerStat(input$opponent_select, input$rbA_players)
    if(is.null(p2)){
      h2('Loading...')
    }
    else{
      scores <- list(
        "Home's player" = c(c(p1$dribbling), c(p1$long_shots), c(p1$acceleration), c(p1$strength), c(p1$stamina), c(p1$crossing)),
        "Away's player" = c(c(p2$dribbling), c(p2$long_shots), c(p2$acceleration), c(p2$strength), c(p2$stamina), c(p2$crossing))
      )
      labs <- c("Dribbing", "Long shot", "Acceleration", "Strength", "Stamina", "Crossing")
      chartJSRadar(scores = scores, labs = labs, maxScale = 100)
    }
  }
})

