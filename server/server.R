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
output$tactic <- reactive(getTactic(
  paste(getTeamApi(input$opponent_select))
))

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


