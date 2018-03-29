header <- dashboardHeader(
  title = "Derby Match Simulator"
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Choose Opponent",tabName = "Choose_opponent", icon = icon("user")),
    menuItem("Select Home Tactic & Players", tabName = "tactic_player", icon = icon("user")),
    menuItem("Select Away Tactic & Players", tabName = "tactic_player2", icon = icon("user")),
    menuItem("Summary", tabName = "summary", icon = icon("th")),
    menuItem("Predition", tabName = "prediction", icon = icon("th"))
  )
)

body <- dashboardBody(
    tabItems(
    # First tab content
    tabItem(tabName = "Choose_opponent",
             fluidRow(
               selectInput("select", label = h3("Select Team"),
                           choices = list("Arsenal" = "Arsenal",
                                          "Aston Villa" = "Aston villa", 	
                                          "Bournemouth" = "Bounemouth", 	
                                          "Chelsea" = "Chelsea",
                                          "Crystal Palace" = "Crystal Palace", 	
                                          "Everton" = "Everton", 	
                                          "Leicester City" = "Leicester", 	
                                          "Liverpool" = "Liverpool", 	
                                          "Manchester City" = "Manchester City",
                                          "Manchester United" = "Manchester United", 	
                                          "Newcastle United" = "Newcastle United", 	
                                          "Norwich City" = "Norwich City", 	
                                          "Southampton" = "Southampton", 	
                                          "Stoke City" = "Stoke City",
                                          "Sunderland" = "Sunderland", 	
                                          "Swansea City" = "Swansea City", 	
                                          "Tottenham Hotspur" = "Tottenham Hotspur",
                                          "Watford" = "Watford", 	
                                          "West Bromwich Albion" = "West Bromwich Albion", 	
                                          "West Ham United" = "West Ham United"),
                           selected = "Arsenal")
               
             )
            
    ),
    
    # Second tab content
    tabItem(tabName = "tactic_player",
      fluidRow(
        column(width = 3,
          box(width = NULL,title = "Tactic",
            selectInput("PlaySpeed", label = h5("PlaySpeed"), 
                          choices = list("Balance" = 1, "Fast" = 2, "Slow" = 3), 
                          selected = 1),
              
              selectInput("PlayDribbling", label = h5("PlayDribbling"), 
                          choices = list("Little" = 1, "Normal" = 2),
                          selected = 1),
              
              selectInput("playPassing", label = h5("playPassing"), 
                          choices = list("Long" = 1, "Mixed" = 2, "Short" = 3), 
                          selected = 1),
              
              selectInput("PlayPositioning", label = h5("PlayPositioning"), 
                          choices = list("Free Form" = 1, "Organised" = 2),
                          selected = 1),
              
              selectInput("ChanceCreationPassing", label = h5("ChanceCreationPassing"), 
                          choices = list("Normal" = 1, "Risky" = 2, "Safe" = 3), 
                          selected = 1),
              
              selectInput("ChanceCreationCross", label = h5("ChanceCreationCross"), 
                          choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                          selected = 1),
              
              selectInput("ChanceCreationShooting", label = h5("ChanceCreationShooting"), 
                          choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                          selected = 1),
              
              selectInput("ChanceCreationPosition", label = h5("ChanceCreationPosition"), 
                          choices = list("Free Form" = 1, "Organised" = 2), 
                          selected = 1),
              
              selectInput("DefencePressure", label = h5("DefencePressure"), 
                          choices = list("Deep" = 1, "High" = 2, "Medium" = 3), 
                          selected = 1),
              
              selectInput("DefenceAggression", label = h5("DefenceAggression"), 
                          choices = list("Contain" = 1, "Double" = 2, "Press" = 3), 
                          selected = 1),
              
              selectInput("DefenceTeamWidth", label = h5("DefenceTeamWidth"), 
                          choices = list("Narrow" = 1, "Normal" = 2, "Wide" = 3), 
                          selected = 1),
              
            actionButton("ok", "OK"))
          ),
        
        column
        (width = 9,
          box(width = NULL, title = "Select 11 players"),
          checkboxGroupInput("checkGroup", label = h3("Manchester United's Player"), 
                             choices = list("David de Gea" = 1, "Phil Jones" = 2, "Marcos Rojo" = 3, "Jonny Evans" = 4, "Memphis Depay" = 5, "Juan Mata" = 6, "Anthony Martial" = 7
                                            , " Wayne Rooney" = 8, "Ander Herrera" = 9, "Chris Smalling" = 10, "Ashley Young" = 11, "Bastian Schweinsteiger" = 8, "Sergio Romero" = 9, "Marouane Fellaini" = 10, "Guillermo Varela" = 11))
        )
      )
    ),
    
    #third tab
    tabItem(tabName = "tactic_player2",
            fluidRow(
              column(width = 3,
                     box(width = NULL,title = "Tactic",
                         selectInput("PlaySpeed", label = h5("PlaySpeed"), 
                                     choices = list("Balance" = 1, "Fast" = 2, "Slow" = 3), 
                                     selected = 1),
                         
                         selectInput("PlayDribbling", label = h5("PlayDribbling"), 
                                     choices = list("Little" = 1, "Normal" = 2),
                                     selected = 1),
                         
                         selectInput("playPassing", label = h5("playPassing"), 
                                     choices = list("Long" = 1, "Mixed" = 2, "Short" = 3), 
                                     selected = 1),
                         
                         selectInput("PlayPositioning", label = h5("PlayPositioning"), 
                                     choices = list("Free Form" = 1, "Organised" = 2),
                                     selected = 1),
                         
                         selectInput("ChanceCreationPassing", label = h5("ChanceCreationPassing"), 
                                     choices = list("Normal" = 1, "Risky" = 2, "Safe" = 3), 
                                     selected = 1),
                         
                         selectInput("ChanceCreationCross", label = h5("ChanceCreationCross"), 
                                     choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                                     selected = 1),
                         
                         selectInput("ChanceCreationShooting", label = h5("ChanceCreationShooting"), 
                                     choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                                     selected = 1),
                         
                         selectInput("ChanceCreationPosition", label = h5("ChanceCreationPosition"), 
                                     choices = list("Free Form" = 1, "Organised" = 2), 
                                     selected = 1),
                         
                         selectInput("DefencePressure", label = h5("DefencePressure"), 
                                     choices = list("Deep" = 1, "High" = 2, "Medium" = 3), 
                                     selected = 1),
                         
                         selectInput("DefenceAggression", label = h5("DefenceAggression"), 
                                     choices = list("Contain" = 1, "Double" = 2, "Press" = 3), 
                                     selected = 1),
                         
                         selectInput("DefenceTeamWidth", label = h5("DefenceTeamWidth"), 
                                     choices = list("Narrow" = 1, "Normal" = 2, "Wide" = 3), 
                                     selected = 1),
                         
                         actionButton("ok", "OK"))
              ),
              
              column
              (width = 9,
                box(width = NULL, title = "Select 11 players"),
                checkboxGroupInput("checkGroup", label = h3("Liverpool's Player"), 
                                   choices = list("Simon Mignolet" = 1, "Nathaniel Clyne" = 2, "Kolo Touré" = 3, "Dejan Lovren" = 4, "Joe Gomez" = 5, "Christian Benteke" = 6, "Roberto Firmino" = 7
                                                  , "Daniel Sturridge" = 8, "Adam Lallana" = 9, "Jordan Henderson" = 10, "Emre Can" = 11, "James Milner" = 8, "Divock Origi" = 9, "Ádám Bogdán" = 10, "Lucas" = 11))
              )
            )
    ),
    
    
    #fourth tab
    tabItem(tabName = "summary",
            h2("Show the summary of both team")
            
    
            
            
            
    ),
    #fifth tab
    tabItem(tabName = "prediction",
            h2("MANCHESTER UNITED WIN"))
    
))

dashboardPage(
  header,
  sidebar,
  body
)


