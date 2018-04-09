shiny::fluidRow(
  column(width = 4,
         box(width = NULL,title = "MANCHESTER UNITED"),
         radioButtons("rb", "Choose one:",
                      choiceNames = list(
                        icon("calendar"),
                        HTML("<p style='color:red;'>Red Text</p>"),
                        "Normal text"
                      ),
                      choiceValues = list(
                        "icon", "html", "text"
                      )),
         textOutput("txt")
  ),
  
  column(width = 4,
         box(width = NULL, title = "test")
  ),
  column(width = 4,
         box(width = NULL, title = "Away Tactic")
)
)