# Define UI for app that draws a histogram ----
library(shinydashboard)

header <- dashboardHeader(
  title = "Derdy Match Simulator"
)

body <- dashboardBody(
  # Boxes need to be put in a row (or column)
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
    
    column(width = 9,
           box(width = NULL, title = "Formular",wellPanel(
             selectInput("Formation", "Formation",
                         c("4-3-3","4-4-2","5-4-1")
             )
           )),
           box(width = NULL, title = "Player",
               uiOutput("ui")
               
           )
    )
  )
)

dashboardPage(
  header,
  dashboardSidebar(disable = TRUE),
  body
)


