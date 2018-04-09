shiny::fluidRow(
  column(width = 3,
         box(width = NULL,title = "Tactic",
             selectInput("PlaySpeedA", label = h5("PlaySpeed"), 
                         choices = list("Balance" = 1, "Fast" = 2, "Slow" = 3), 
                         selected = tactic_opponent$H_buildUpPlaySpeedClass),
             
             selectInput("PlayDribblingA", label = h5("PlayDribbling"), 
                         choices = list("Little" = 1, "Normal" = 2),
                         selected = tactic_opponent$H_buildUpPlayDribblingClass),
             
             selectInput("playPassingA", label = h5("playPassing"), 
                         choices = list("Long" = 1, "Mixed" = 2, "Short" = 3), 
                         selected = tactic_opponent$H_buildUpPlayPassingClass),
             
             selectInput("PlayPositioningA", label = h5("PlayPositioning"), 
                         choices = list("Free Form" = 1, "Organised" = 2),
                         selected = tactic_opponent$H_buildUpPlayPositioningClass),
             
             selectInput("ChanceCreationPassingA", label = h5("ChanceCreationPassing"), 
                         choices = list("Normal" = 1, "Risky" = 2, "Safe" = 3), 
                         selected = tactic_opponent$H_chanceCreationPassingClass),
             
             selectInput("ChanceCreationCrossA", label = h5("ChanceCreationCross"), 
                         choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                         selected = tactic_opponent$H_chanceCreationCrossingClass),
             
             selectInput("ChanceCreationShootingA", label = h5("ChanceCreationShooting"), 
                         choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                         selected = tactic_opponent$H_chanceCreationShootingClass),
             
             selectInput("ChanceCreationPositionA", label = h5("ChanceCreationPosition"), 
                         choices = list("Free Form" = 1, "Organised" = 2), 
                         selected = tactic_opponent$H_chanceCreationPositioningClass),
             
             selectInput("DefencePressureA", label = h5("DefencePressure"), 
                         choices = list("Deep" = 1, "High" = 2, "Medium" = 3), 
                         selected = tactic_opponent$H_defencePressureClass),
             
             selectInput("DefenceAggressionA", label = h5("DefenceAggression"), 
                         choices = list("Contain" = 1, "Double" = 2, "Press" = 3), 
                         selected = tactic_opponent$H_defenceAggressionClass),
             
             selectInput("DefenceTeamWidthA", label = h5("DefenceTeamWidth"), 
                         choices = list("Narrow" = 1, "Normal" = 2, "Wide" = 3), 
                         selected = tactic_opponent$H_defenceTeamWidthClass),
             
             actionButton("ok", "OK"))
  ),
  
  column(width = 9,
    box(width = NULL, title = "Select 11 players"),
    checkboxGroupInput("checkGroup", label = h3("Liverpool's Player"), 
                       choices = list("Simon Mignolet" = 1,
                                      "Nathaniel Clyne" = 2,
                                      "Kolo Touré" = 3, "Dejan Lovren" = 4, "Joe Gomez" = 5, "Christian Benteke" = 6, "Roberto Firmino" = 7
                                      , "Daniel Sturridge" = 8, "Adam Lallana" = 9, "Jordan Henderson" = 10, "Emre Can" = 11, "James Milner" = 8, "Divock Origi" = 9, "Ádám Bogdán" = 10, "Lucas" = 11))
  )
)