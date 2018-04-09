# library(shinydashboard)
# library(shiny)
# 
# getTactic <- function(teamApi){
#   for(nr in nrow(Matchs):1){
#     if(Matchs$away_team_api_id[nr] == teamApi){
#       tactic <- Matchs[nr, 8:18]
#       break
#     }  
#     else if(Matchs$home_team_api_id[nr] == teamApi){
#       tactic <- Matchs[nr, 19:29]
#       break
#     }
#   }
#   return(tactic)
# }
# 
# getTeamApi <- function(teamName){
#   return(Team_api_name[which(Team_api_name$team_long_name == teamName), ]$team_api_id)
# }


# set_tactic_default = 1
# tactic_h <- data.frame('H_buildUpPlaySpeedClass' = set_tactic_default, 
#                      'H_buildUpPlayDribblingClass' = set_tactic_default,
#                      'H_buildUpPlayPassingClass'= set_tactic_default, 
#                      'H_buildUpPlayPositioningClass'= set_tactic_default, 
#                      'H_chanceCreationPassingClass'= set_tactic_default,
#                      'H_chanceCreationCrossingClass'= set_tactic_default, 
#                      'H_chanceCreationShootingClass'= set_tactic_default, 
#                      'H_chanceCreationPositioningClass'= set_tactic_default,
#                      'H_defencePressureClass' = set_tactic_default, 
#                      'H_defenceAggressionClass' = set_tactic_default, 
#                      'H_defenceTeamWidthClass' = set_tactic_default)
# 
# rm(set_tactic_default)

# header <- dashboardHeader(
#   title = "Derby Match Simulator"
# )

# sidebar <- dashboardSidebar(
#   sidebarMenu(
#     menuItem("Choose Opponent",tabName = "Choose_opponent", icon = icon("user")),
#     menuItem("Select Home Tactic & Players", tabName = "tactic_player", icon = icon("user")),
#     menuItem("Select Away Tactic & Players", tabName = "tactic_player2", icon = icon("user")),
#     menuItem("Summary", tabName = "summary", icon = icon("th")),
#     menuItem("Predition", tabName = "prediction", icon = icon("th"))
#   )
# )

body <- dashboardBody(
    tabItems(
    # First tab content
   ,
    
    # Second tab content(Home team)
    tabItem(tabName = "tactic_player",
        shinydashboard::fluidRow(
        column(width = 3,
               shinydashboard::box(width = NULL,title = "Tactic",
                   selectInput("PlaySpeed", label = h5("PlaySpeed"), 
                               choices = list("Balance" = 1, "Fast" = 2, "Slow" = 3), 
                               selected = tactic$H_buildUpPlaySpeedClass),
                   
                   selectInput("PlayDribbling", label = h5("PlayDribbling"), 
                               choices = list("Little" = 1, "Normal" = 2),
                               selected = tactic$H_buildUpPlayDribblingClass),
                   
                   selectInput("playPassing", label = h5("playPassing"), 
                               choices = list("Long" = 1, "Mixed" = 2, "Short" = 3), 
                               selected = tactic$H_buildUpPlayPassingClass),
                   
                   selectInput("PlayPositioning", label = h5("PlayPositioning"), 
                               choices = list("Free Form" = 1, "Organised" = 2),
                               selected = tactic$H_buildUpPlayPositioningClass),
                   
                   selectInput("ChanceCreationPassing", label = h5("ChanceCreationPassing"), 
                               choices = list("Normal" = 1, "Risky" = 2, "Safe" = 3), 
                               selected = tactic$H_chanceCreationPassingClass),
                   
                   selectInput("ChanceCreationCross", label = h5("ChanceCreationCross"), 
                               choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                               selected = tactic$H_chanceCreationCrossingClass),
                   
                   selectInput("ChanceCreationShooting", label = h5("ChanceCreationShooting"), 
                               choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                               selected = tactic$H_chanceCreationShootingClass),
                   
                   selectInput("ChanceCreationPosition", label = h5("ChanceCreationPosition"), 
                               choices = list("Free Form" = 1, "Organised" = 2), 
                               selected = tactic$H_chanceCreationPositioningClass),
                   
                   selectInput("DefencePressure", label = h5("DefencePressure"), 
                               choices = list("Deep" = 1, "High" = 2, "Medium" = 3), 
                               selected = tactic$H_defencePressureClass),
                   
                   selectInput("DefenceAggression", label = h5("DefenceAggression"), 
                               choices = list("Contain" = 1, "Double" = 2, "Press" = 3), 
                               selected = tactic$H_defenceAggressionClass),
                   
                   selectInput("DefenceTeamWidth", label = h5("DefenceTeamWidth"), 
                               choices = list("Narrow" = 1, "Normal" = 2, "Wide" = 3), 
                               selected = tactic$H_defenceTeamWidthClass),
              
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
    
    #tacticA <- getTactic(getTeamApi("AwayTeam")),
    #third tab
    tabItem(tabName = "tactic_player2",
            shinydashboard::fluidRow(
              column(width = 3,
                     box(width = NULL,title = "Tactic",
                         selectInput("PlaySpeedA", label = h5("PlaySpeed"), 
                                     choices = list("Balance" = 1, "Fast" = 2, "Slow" = 3), 
                                     selected = tacticA$H_buildUpPlaySpeedClass),
                         
                         selectInput("PlayDribblingA", label = h5("PlayDribbling"), 
                                     choices = list("Little" = 1, "Normal" = 2),
                                     selected = tacticA$H_buildUpPlayDribblingClass),
                         
                         selectInput("playPassingA", label = h5("playPassing"), 
                                     choices = list("Long" = 1, "Mixed" = 2, "Short" = 3), 
                                     selected = tacticA$H_buildUpPlayPassingClass),
                         
                         selectInput("PlayPositioningA", label = h5("PlayPositioning"), 
                                     choices = list("Free Form" = 1, "Organised" = 2),
                                     selected = tacticA$H_buildUpPlayPositioningClass),
                         
                         selectInput("ChanceCreationPassingA", label = h5("ChanceCreationPassing"), 
                                     choices = list("Normal" = 1, "Risky" = 2, "Safe" = 3), 
                                     selected = tacticA$H_chanceCreationPassingClass),
                         
                         selectInput("ChanceCreationCrossA", label = h5("ChanceCreationCross"), 
                                     choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                                     selected = tacticA$H_chanceCreationCrossingClass),
                         
                         selectInput("ChanceCreationShootingA", label = h5("ChanceCreationShooting"), 
                                     choices = list("Little" = 1, "Lots" = 2, "Normal" = 3), 
                                     selected = tacticA$H_chanceCreationShootingClass),
                         
                         selectInput("ChanceCreationPositionA", label = h5("ChanceCreationPosition"), 
                                     choices = list("Free Form" = 1, "Organised" = 2), 
                                     selected = tacticA$H_chanceCreationPositioningClass),
                         
                         selectInput("DefencePressureA", label = h5("DefencePressure"), 
                                     choices = list("Deep" = 1, "High" = 2, "Medium" = 3), 
                                     selected = tacticA$H_defencePressureClass),
                         
                         selectInput("DefenceAggressionA", label = h5("DefenceAggression"), 
                                     choices = list("Contain" = 1, "Double" = 2, "Press" = 3), 
                                     selected = tacticA$H_defenceAggressionClass),
                         
                         selectInput("DefenceTeamWidthA", label = h5("DefenceTeamWidth"), 
                                     choices = list("Narrow" = 1, "Normal" = 2, "Wide" = 3), 
                                     selected = tacticA$H_defenceTeamWidthClass),
                         
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

ui <- dashboardPage(
  header,
  sidebar,
  body
)

shinyApp(ui, server)

