#render tactic
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



#generate tactic for away team  
output$select_input_Away <- renderUI({
  tactic <- getTactic(getTeamApi(input$opponent_select))
  
  tagList(
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
                selected = tactic$Passing),
    
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

vals <- reactiveValues(data = NULL)
dataModal <- function(failed = FALSE) {
  modalDialog(
    selectInput("dataset", "Select Data",getData(""),selected="Name 1" ,multiple = FALSE),
    span('(select one player)'),
    
    footer = tagList(
      modalButton("Cancel"),
      actionButton("ok", "OK")
    )
  )
}

lapply(1:11,function(i){
  observeEvent(input[[paste0("show",i)]], {
    showModal(dataModal())
  })
})

observeEvent(input$ok, {
  vals$data <- ({input$dataset})
  removeModal()
  
})

# Display information about selected data
output$dataInfo <- renderPrint({
  if (is.null(vals$data))
    "No data selected"
  else
    vals$data
})

#ui away player
output$Awayplayer <- renderUI({
  playerList <- toStringPlayers(getPlayers(input$opponent_select))
  apiList <- apiPlayers(getPlayers(input$opponent_select))
  tempText <- paste(input$opponent_select,"'s Player")
  checkboxGroupInput("AwayPlayerGroup", label = h3(tempText), 
                     choiceNames = playerList,
                     choiceValues = apiList,
                     selected = apiList[1:11]
  )
})

#ui home player
output$Homeplayer<- renderUI({
  playerList <- toStringPlayers(getPlayers("Manchester United"))
  apiList <- apiPlayers(getPlayers("Manchester United"))
  checkboxGroupInput("HomePlayerGroup", label = h3("Manchester United's Player"), 
                     choiceNames = playerList,
                     choiceValues = apiList,
                     selected = apiList[1:11]
  )
})

#tab 4 by mighty not done yet
output$selected_Hplayers <- renderUI({
  playerlist <- toStringPlayers(getPlayers("Manchester United",input$HomePlayerGroup))

  radioButtons("rbH_players", "Choose one:",
               choiceNames = playerlist,
               choiceValues = input$HomePlayerGroup)
})

output$selected_Aplayers <- renderUI({
  playerlist <- toStringPlayers(getPlayers(input$opponent_select,input$AwayPlayerGroup))
  
  radioButtons("rbA_players", "Choose one:",
               choiceNames = playerlist,
               choiceValues = input$AwayPlayerGroup)
})

#mock up
labs <- c("Dribbing", "Long shot", "Acceleration",
          "Strength",  "Stamina", "Crossing")

scores <- list(
  "Mata" = getPlayerStat("Manchester United",input$rbH_players)
  "Ramsey" = c(80, 50, 75, 65, 67, 95)
)
output$radar<- renderChartJSRadar({
  chartJSRadar(scores = scores, labs = labs, maxScale = 100)
})

