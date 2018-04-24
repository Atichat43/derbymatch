shiny::fluidRow(
  column(width = 4,
         box(width = NULL,title = "Home Tactic"),
         uiOutput(outputId = "selected_Hplayers")
  ),
  
  column(width = 4,
         box(width = NULL, title = "test"),
         chartJSRadarOutput("radar",width = "450",height = "300")
  ),
  column(width = 4,
         box(width = NULL, title = "Away Tactic"),
         uiOutput(outputId = "selected_Aplayers")
         
  )
)