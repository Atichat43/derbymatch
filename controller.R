createDefaultTactic <- function(){
  tactic <- data.frame('PlaySpeed' = 1, 
                       'PlayDribbling' = 1,
                       'PlayPassing'= 1, 
                       'PlayPositioning'= 1, 
                       'Passing'= 1,
                       'Crossing'= 1, 
                       'Shooting'= 1, 
                       'Positioning'= 1,
                       'Pressure' = 1, 
                       'Aggression' = 1, 
                       'TeamWidth' = 1)
  return(tactic)
}

getTeamApi <- function(team_name){
  return(getTeamApiName(team_name))
}

getTactic <- function(team_api){
  temp_tactic <- createDefaultTactic()
  last_tactic <- getLastTactic(team_api) #DataConnector: getLastTactic(team_api)
  temp_tactic[1:length(temp_tactic)] <- last_tactic[1:length(temp_tactic)]
  apply(temp_tactic, 2, as.numeric)
  return(temp_tactic)
}


