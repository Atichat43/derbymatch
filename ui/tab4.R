shiny::fluidRow(
  column(width = 4,
         box(width = NULL,title = "MANCHESTER UNITED"),
         radioButtons("radio", label = h3("Choose one"),
                      choices = list("Ashley Young" = 1, "Bastian Schweinsteger" = 2, "Wayne Rooney" = 3,"Michael Carrick" = 1, "Antonio Valencia" = 2, "Marouane Fellaini" = 3,
                                     "Juan Mata" = 1, "Matteo Darmian" = 2, "Morgan Schneiderlin" = 3,"Sergio Romeo" = 2, "Marcos Rojo" = 3), 
                      selected = 1)
  ),
  
  column(width = 4,
         box(width = NULL, title = "test")
  ),
  column(width = 4,
         box(width = NULL, title = "Away Tactic"),
         radioButtons("radio2", label = h3("Choose one"),
                      choices = list("Ashley Young" = 1, "Bastian Schweinsteger" = 2, "Wayne Rooney" = 3,"Michael Carrick" = 1, "Antonio Valencia" = 2, "Marouane Fellaini" = 3,
                                     "Juan Mata" = 1, "Matteo Darmian" = 2, "Morgan Schneiderlin" = 3,"Sergio Romeo" = 2, "Marcos Rojo" = 3), 
                      selected = 1)
)
)