shiny::fluidRow(
  column(width = 4,
         box(width = NULL,title = "MANCHESTER UNITED",
             uiOutput(outputId = "HomeApi")
             )
  
  ),
  
  column(width = 4,
         box(width = NULL, title = "test"),
         chartJSRadarOutput("radar",width = "450",height = "300")
  ),
  column(width = 4,
         box(width = NULL, title = "Away Tactic"),
         textOutput("PlaySpeedA")
)
)
