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

getPlayers <- function(team_name, lst_api = c("")){
  table_players <- getPlayersTable(team_name)
  #table_players <- subset(table_players, select = c(player_name, player_position, player_number))
  lst_api <- as.data.frame(lst_api)
  if(lst_api[1, ] != ""){
    temp <- table_players[1,]
    for(nr in 1:nrow(lst_api)){
      for(i in 1:nrow(table_players)){
        if(lst_api[nr, 1] == table_players$player_api_id[i]){
          temp[nr, ] <- table_players[i, ]
          break
        }
      }
    }
    return(temp)
  }
  return(table_players)
}

getPlayerStat <- function(team_name, player_api){
  table_players <- getPlayersTable(team_name)
  table_players <- subset(table_players, select = c("player_api_id", "dribbling", "long_shots", "acceleration", "strength", "stamina", "crossing"))
  for(nr in 1:nrow(table_players)){
    if(player_api == table_players$player_api_id[nr]){
      return(table_players[nr, -1])
    }
  }
}
###############################################################################################################
toStringApiPlayers <- function(df_players){
  n_players <- nrow(df_players)
  temp_array_api <- as.array(as.character(1:n_players))
  for(nr in 1:n_players){
    temp_array_api[nr] <- as.character(df_players$player_api_id[nr])
  }
  return(temp_array_api)
}

toStringPlayersChoices <- function(df_players){
  df_players <- subset(df_players, select=c('player_name', 'player_position', 'player_number'))
  df_players <- apply(df_players, 2, as.character)
  n_players <- nrow(df_players)
  arr <- as.array(as.character(1:n_players))
  for(nr in 1:n_players){
    arr[nr] <- paste(df_players[nr, 1],df_players[nr, 2],df_players[nr, 3], sep=" / ")
  }
  return(arr)
}
