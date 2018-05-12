source("init.R")

tactic <- createDefaultTactic()
#tactic_opponent <- createDefaultTactic()
ui <- {fluidPage(
  source(file.path("ui", "header.R"),  local = TRUE)$value,
  source(file.path("ui", "tab1.R"),  local = TRUE)$value)
}

server <- function(input, output) {
  source(file.path("server", "server.R"),  local = TRUE)$value
}

shinyApp(ui, server)