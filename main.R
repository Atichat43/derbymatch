source("init.R")
ui <- fluidPage(
  # source(file.path("ui", "title.R"),  local = TRUE)$value,
  source(file.path("ui", "ui.R"),  local = TRUE)$value
)


server <- function(input, output) {
  source(file.path("server", "server.R"),  local = TRUE)$value
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)