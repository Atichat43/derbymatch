shiny::fluidRow(
  column(width = 3,
         box(width = NULL,title = "Away Tactic",
             uiOutput(outputId = "select_input_Away")
        )
  ),
  
  column(width = 9,
    box(width = NULL, title = "Select 11 players",
    checkboxGroupInput("checkGroup", label = h3("Liverpool's Player"), 
                       choices = list("Simon Mignolet" = 1,
                                      "Nathaniel Clyne" = 2,
                                      "Kolo Touré" = 3,
                                      "Dejan Lovren" = 4,
                                      "Joe Gomez" = 5,
                                      "Christian Benteke" = 6, 
                                      "Roberto Firmino" = 7,
                                      "Daniel Sturridge" = 8, 
                                      "Adam Lallana" = 9,
                                      "Jordan Henderson" = 10, 
                                      "Emre Can" = 11, 
                                      "James Milner" = 8, 
                                      "Divock Origi" = 9,
                                      "Ádám Bogdán" = 10, 
                                      "Lucas" = 11))
  ))
)