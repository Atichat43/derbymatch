shiny::fluidRow(
  column(width = 3,
         box(width = NULL,title = "Away Tactic",
             uiOutput(outputId = "select_input_Away")
        )
  ),
  
  column(width = 9,
    box(width = NULL, title = "Select 11 players",
        uiOutput(outputId = "Awayplayer")
    )
  )
)