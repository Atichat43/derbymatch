
output$playerslist<-renderUI({
  selectInput("playerslist", "Select Data", choices=getData(), selected=playerslist[1])
})
