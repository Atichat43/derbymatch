shiny::fluidRow(
  column(width = 3,
         box(width = NULL,title = "Home Tactic",
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
  ),
  
  column(width = 9,
    shinydashboard::box(width = NULL, title = "Select 11 players",
    checkboxGroupInput("checkGroup", label = h3("Manchester United's Player"), 
                       choices = list("David de Gea" = 1, 
                                      "Phil Jones" = 2, 
                                      "Marcos Rojo" = 3, 
                                      "Jonny Evans" = 4, 
                                      "Memphis Depay" = 5, 
                                      "Juan Mata" = 6, 
                                      "Anthony Martial" = 7,
                                      "Wayne Rooney" = 8,
                                      "Ander Herrera" = 9,
                                      "Chris Smalling" = 10,
                                      "Ashley Young" = 11,
                                      "Bastian Schweinsteiger" = 8,
                                      "Sergio Romero" = 9,
                                      "Marouane Fellaini" = 10,
                                      "Guillermo Varela" = 11))
  ))
)
