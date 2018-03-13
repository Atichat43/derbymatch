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

accuracy <- function(truth, prediction) {
  new_table <- table(truth, prediction)
  sum(diag(new_table)/sum(new_table))
}
