server <- function(input, output) {
  
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
  
  

  output$ui <- renderUI({
    if (is.null(input$Formation))
      return()
    switch(input$Formation,
           "4-3-3" =   tagList (
                 lapply(1:11,function(i){
                  column(3,box(title="player",actionButton(paste0("show",i),paste0("player",i))))                   
                 })
               ),
    
           "4-4-2" = tagList (
             lapply(1:11,function(i){
               column(3,box(title="player",actionButton(paste0("show",i),paste0("player",i))))                   
             })
           ),
           "5-4-1" = tagList (
             lapply(1:11,function(i){
               column(3,box(title="player",actionButton(paste0("show",i),paste0("player",i))))                   
             })
           )
           
    )
  })
}

