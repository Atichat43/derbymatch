library(shiny)
players <- read.csv("./datasets/ManU_player.csv")

getData <- function(position) {
  if(position == "Goalkeeper")
    players <- players[1:3, 3]
  else if(position == "Defender")
    players <- players[4:10,3]
  else if(position == "Midfielder")
    players <- players[11:20,3]
  else if(position == "Forward")
    players <- players[21:23,3]
  else
    players <- players[,3]
  return(players)
}

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Hello Shiny!"),
  
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        
        selectInput("playerslist", "Select Data",getData(""),selected="Name 1" ,multiple = FALSE),
        
        
        submitButton("Predict")),
      
      mainPanel(
        textOutput("PLAYER")
      )
    )
  ))


server <- function(input, output) {
  
  
  output$playerslist<-renderUI({
    selectInput("playerslist", "Select Data", choices=getData(), selected=playerslist[1])
  })
  
  
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)