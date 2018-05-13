##############################################################################################
#render tactic OUR TEAM
#global number of players 
output$PlaySpeed<- renderText({
  paste("PlaySpeed",input$PlaySpeed)
})

output$PlayDribbing <- renderText({
  paste("PlayDribbing",input$PlayDribbing)
})

output$PlayPassing <- renderText({
  paste("PlayPassing",input$PlayPassing)
})

output$PlayPositioning <- renderText({
  paste("PlayPositioning",input$PlayPositioning)
})

output$ChanceCreationPassing<- renderText({
  paste("ChanceCreationPassing",input$ChanceCreationPassing)
})

output$ChanceCreationCross<- renderText({
  paste("ChanceCreationCross",input$ChanceCreationCross)
})

output$ChanceCreationShooting<- renderText({
  paste("ChanceCreationShooting",input$ChanceCreationShooting)
})

output$DefencePressure<- renderText({
  paste("DefencePressure",input$DefencePressure)
})

output$DefenceAggretion<- renderText({
  paste("DefenceAggretion",input$DefenceAggretion)
})

output$DefenceTeamWidth<- renderText({
  paste("DefenceTeamWidth",input$DefenceTeamWidth)
})

####
observeEvent(input$opponent_select,{
  print('update')
  }
)

#generate tactic for away team  
output$select_input_Away <- renderUI({
  tactic <- getTactic(getTeamApi(input$opponent_select))  #Controller:: getTactic getTeamApi
  tagList(title = h3("Away Tactic"),
    hr(class='my-4'),
    selectInput("PlaySpeed", label = h5("PlaySpeed"), 
                choices = list("Balance" = 1, "Fast" = 2, "Slow" = 3), 
                selected = tactic$PlaySpeed),
    
    selectInput("PlayDribbling", label = h5("PlayDribbling"), 
                choices = list("Little" = 1, "Normal" = 2),
                selected = tactic$PlayDribbling),
    
    selectInput("playPassing", label = h5("playPassing"), 
                choices = list("Long" = 1, "Mixed" = 2, "Short" = 3), 
                selected = tactic$PlayPassing),
    
    selectInput("PlayPositioning", label = h5("PlayPositioning"), 
                choices = list("Free Form" = 1, "Organised" = 2),
                selected = tactic$PlayPositioning),
    
    selectInput("ChanceCreationPassing", label = h5("ChanceCreationPassing"), 
                choices = list("Normal" = 1, "Risky" = 2, "Safe" = 3), 
                selected = tactic$Passing)
  )
})

output$select_input_Away2 <- renderUI({
  tactic <- getTactic(getTeamApi(input$opponent_select))   #Controller:: getTactic getTeamApi
  tagList(
    hr(class='my-2'),
    selectInput("ChanceCreationCross", label = h5("ChanceCreationCross"), 
                choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                selected = tactic$Crossing),
    
    selectInput("ChanceCreationShooting", label = h5("ChanceCreationShooting"), 
                choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                selected = tactic$Shooting),
    
    selectInput("ChanceCreationPosition", label = h5("ChanceCreationPosition"), 
                choices = list("Free Form" = 1, "Organised" = 2), 
                selected = tactic$Positioning),
    
    selectInput("DefencePressure", label = h5("DefencePressure"), 
                choices = list("Deep" = 1, "High" = 2, "Medium" = 3), 
                selected = tactic$Pressure),
    
    selectInput("DefenceAggression", label = h5("DefenceAggression"), 
                choices = list("Contain" = 1, "Double" = 2, "Press" = 3), 
                selected = tactic$Aggression),
    
    selectInput("DefenceTeamWidth", label = h5("DefenceTeamWidth"), 
                choices = list("Narrow" = 1, "Normal" = 2, "Wide" = 3), 
                selected = tactic$TeamWidth)
  )
})

#####################################################################################################
#render tactic Away Team
output$PlaySpeedA<- renderText({
  paste("PlaySpeed",input$PlaySpeedA)
})

output$PlayDribbingA <- renderText({
  paste("PlayDribbing",input$PlayDribbingA)
})

output$PlayPassingA <- renderText({
  paste("PlayPassing",input$PlayPassingA)
})

output$PlayPositioningA <- renderText({
  paste("PlayPositioning",input$PlayPositioningA)
})

output$ChanceCreationPassingA<- renderText({
  paste("ChanceCreationPassing",input$ChanceCreationPassingA)
})

output$ChanceCreationCrossA<- renderText({
  paste("ChanceCreationCross",input$ChanceCreationCrossA)
})

output$ChanceCreationShootingA<- renderText({
  paste("ChanceCreationShooting",input$ChanceCreationShootingA)
})

output$DefencePressureA<- renderText({
  paste("DefencePressure",input$DefencePressureA)
})

output$DefenceAggretionA<- renderText({
  paste("DefenceAggretion",input$DefenceAggretionA)
})

output$DefenceTeamWidthA<- renderText({
  paste("DefenceTeamWidth",input$DefenceTeamWidthA)
  
})


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
  playerlist <- toStringPlayersChoices(getPlayers(input$opponent_select, input$AwayPlayerGroup)) #toStringPlayersChoices, getPlayers
  radioButtons("rbA_players", "Choose one:",
               choiceNames = playerlist,
               choiceValues = input$AwayPlayerGroup)
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
    scores <- list(
      "Home's player" = c(c(p1$dribbling), c(p1$long_shots), c(p1$acceleration), c(p1$strength), c(p1$stamina), c(p1$crossing)),
      "Away's player" = c(c(p2$dribbling), c(p2$long_shots), c(p2$acceleration), c(p2$strength), c(p2$stamina), c(p2$crossing))
    )
    labs <- c("Dribbing", "Long shot", "Acceleration", "Strength", "Stamina", "Crossing")
    chartJSRadar(scores = scores, labs = labs, maxScale = 100)
  }
})

