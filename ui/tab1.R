team <-c("Arsenal" = "Arsenal",
     "Aston Villa" = "Aston Villa", 	
     "Bournemouth" = "Bournemouth", 	
     "Chelsea" = "Chelsea",
     "Crystal Palace" = "Crystal Palace", 	
     "Everton" = "Everton", 	
     "Leicester City" = "Leicester City", 	
     "Liverpool" = "Liverpool", 	
     "Manchester City" = "Manchester City",
     "Newcastle United" = "Newcastle United", 	
     "Norwich City" = "Norwich City", 	
     "Southampton" = "Southampton", 	
     "Stoke City" = "Stoke City",
     "Sunderland" = "Sunderland", 	
     "Swansea City" = "Swansea City", 	
     "Tottenham Hotspur" = "Tottenham Hotspur",
     "Watford" = "Watford", 	
     "West Bromwich Albion" = "West Bromwich Albion", 	
     "West Ham United" = "West Ham United")

fluidRow(
  column(4, wellPanel(
    id = "leftPanel",
    div(
        id = "opponentTeamPanel",
        selectInput("opponent_select", label = h3("Select Team"),team)
    ),
    div(
      id = "appDesc",
      h2("WIN")
    )
  )),
  
  column(8, wellPanel(
    tabsetPanel(
      id = "mainTabs", type = "tabs",
      
      tabPanel(
        title = "Select Home Tactic & Players", id ="descTab", value = "descTab",
        fluidRow(
          column(width = 4,
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
                                 selected = tactic$Passing)
                 )),
          column(width = 4,
                 box(width = NULL,title = " ",
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
                 )),
          column(width = 4,
                 box(width = NULL, title = "Select 11 players",
                     uiOutput(outputId = "Homeplayer")
                 ))
        )
        
      ),
      
      tabPanel(
        title = "Select Away Tactic & Players", id = "codeTab", value = "codeTab",
        fluidRow(
          column(width = 4,
                 uiOutput(outputId = "select_input_Away")
          ),
          column(width = 4,
                 uiOutput(outputId = "select_input_Away2")
          ),
          column(width = 4,
                 box(width = NULL, title = "Select 11 players",
                     uiOutput(outputId = "Awayplayer")
                 )
          )
        )
      ),        

      tabPanel(
        title = "Summary", id = "submitTab", value = "submitTab",
        fluidRow(
          column(width = 4,
                 box(width = NULL,title = "Home Tactic"),
                 uiOutput(outputId = "selected_Hplayers")
          ),
          
          column(width = 4,
                 box(width = NULL, title = "test"),
                 chartJSRadarOutput("radar",width = "450",height = "300")
          ),
          column(width = 4,
                 box(width = NULL, title = "Away Tactic"),
                 uiOutput(outputId = "selected_Aplayers")
          )
        )
      )
    )
  ))
)

