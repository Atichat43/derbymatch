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

MANUNITED_API <- 10260

createDefaultTactic <- function(){
  set_tactic_default = 1
  tactic <- data.frame('PlaySpeed' = set_tactic_default, 
                       'PlayDribbling' = set_tactic_default,
                       'PlayPassing'= set_tactic_default, 
                       'PlayPositioning'= set_tactic_default, 
                       'Passing'= set_tactic_default,
                       'Crossing'= set_tactic_default, 
                       'Shooting'= set_tactic_default, 
                       'Positioning'= set_tactic_default,
                       'Pressure' = set_tactic_default, 
                       'Aggression' = set_tactic_default, 
                       'TeamWidth' = set_tactic_default)
  rm(set_tactic_default)
  return(tactic)
}

getTactic <- function(teamApi){
  matches <- getDataset()
  for(nr in nrow(matches):1){
    if(matches$home_team_api_id[nr] == teamApi && matches$away_team_api_id[nr] == MANUNITED_API){
      tactic <- matches[nr, 8:18]
      break
    }  
    else if(matches$away_team_api_id[nr] == teamApi && matches$home_team_api_id[nr] == MANUNITED_API){
      tactic <- matches[nr, 19:29]
      break
    }
  }
  temp_tactic <- createDefaultTactic()
  temp_tactic[1:length(temp_tactic)] <- tactic[1:length(temp_tactic)]
  apply(temp_tactic, 2, as.numeric)
  return(temp_tactic)
}

getTeamApi <- function(teamName){
  return(team_api_name[which(team_api_name$team_long_name == teamName), ]$team_api_id)
}

#plot graph_com
scores <- data.frame("Label"=c("ball control", "acceleration", "dribbing",
                               "strength",  "long shot", "crossing"),
                     "Manchester United" = c(9, 7, 4, 5, 3, 7),
                     "Andy" = c(7, 6, 6, 2, 6, 9))

chartJSRadar(scores, maxScale = 10, showToolTipLabel=TRUE)


