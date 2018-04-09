source("init.R")

# 
# ui <- fluidPage(
#   # source(file.path("ui", "title.R"),  local = TRUE)$value,
#   #source(file.path("ui", "ui.R"),  local = TRUE)$value
# )
tactic <- createDefaultTactic()
#tactic_opponent <- createDefaultTactic()
ui <- dashboardPage(
  source(file.path("ui", "header.R"),  local = TRUE)$value,
  source(file.path("ui", "sidebar.R"),  local = TRUE)$value,
  dashboardBody(
    shinydashboard::tabItems(
      tabItem(tabName = "Choose_opponent",
        source(file.path("ui", "tab1.R"),  local = TRUE)$value
      ),
      tabItem(tabName = "tactic_player",
        source(file.path("ui", "tab2.R"),  local = TRUE)$value
      ),
      tabItem(tabName = "tactic_player2",
        source(file.path("ui", "tab3.R"),  local = TRUE)$value
      ),
      #fourth tab
      tabItem(tabName = "summary",
              h2("Show the summary of both team")
              
      ),
      #fifth tab
      tabItem(tabName = "prediction",
              h2("MANCHESTER UNITED WIN"))
      
    )
  )
)

server <- function(input, output) {
  source(file.path("server", "server.R"),  local = TRUE)$value
}

shinyApp(ui, server)