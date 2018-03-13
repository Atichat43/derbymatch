# Define UI for app that draws a histogram ----
fluidPage(
  sidebarLayout(
    sidebarPanel(
      
      selectInput("playerslist", "Select Data",getData(""),selected="Name 1" ,multiple = FALSE),
      
      
      submitButton("Predict")),
    
    mainPanel(
      textOutput("PLAYER")
    )
  )
)