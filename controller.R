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
  if(team_name == '' || is.null(team_name)){
    return(NULL)
  }
  return(getTeamApiName(team_name))
}

getTactic <- function(team_api){
  last_tactic <- getLastTactic(team_api) #DataConnector: getLastTactic(team_api)
  if(is.null(last_tactic)){
    return(NULL)
  }
  temp_tactic <- createDefaultTactic()
  temp_tactic[1:length(temp_tactic)] <- last_tactic[1:length(temp_tactic)]
  apply(temp_tactic, 2, as.numeric)
  return(temp_tactic)
}

#testing
getPlayers <- function(team_name, lst_api = c("")){
  table_players <- getPlayersTable(team_name)
  if(is.null(table_players)){
    return(NULL)
  }
  lst_api <- as.data.frame(lst_api)
  if(lst_api[1, ] != ""){
    df_players <- table_players[1,]
    for(nr in 1:nrow(lst_api)){
      for(i in 1:nrow(table_players)){
        if(lst_api[nr, 1] == table_players$player_api_id[i]){
          df_players[nr, ] <- table_players[i, ]
          break
        }
      }
    }
    return(df_players) #return dataframe of players have api_id in lst_api  
  }
  return(table_players) #if lst_api is empty return all of players team
}

getPlayerStat <- function(team_name, player_api){
  if(is.null(player_api) || player_api == '' || is.null(team_name) || team_name == ''){
    return(NULL)
  }
  table_players <- getPlayersTable(team_name)
  if(is.null(table_players)){
    return(NULL)
  }
  table_players <- subset(table_players, select = c("player_api_id", "dribbling", "long_shots", "acceleration", "strength", "stamina", "crossing"))
  for(nr in 1:nrow(table_players)){
    if(player_api == table_players$player_api_id[nr]){
      return(table_players[nr, -1])
    }
  }
}

getOverallRatingPotential <- function(team_name, player_apis){
  if(is.null(player_apis) || player_apis == '' || is.null(team_name) || team_name == ''){
    return(NULL)
  }
  table_players <- getPlayersTable(team_name)
  if(is.null(table_players)){
    return(NULL)
  }
  table_players <- subset(table_players, select = c("player_api_id", "overall_rating", "potential"))
  total_overall <- 0
  total_potential <- 0
  for(nr in 1:nrow(player_apis)){
    if(player_apis[nr] == table_players$player_api_id[nr]){
      total_overall = total_overall + table_players$overall_rating[nr]
      total_potential = total_potential + table_players$potential[nr]
    }
  }
  return(c(total_overall, total_potential))
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
  if(is.null(df_players)){
    return('')
  }
  df_players <- subset(df_players, select=c('player_name', 'player_position', 'player_number'))
  df_players <- apply(df_players, 2, as.character)
  n_players <- nrow(df_players)
  arr <- as.array(as.character(1:n_players))
  for(nr in 1:n_players){
    arr[nr] <- paste(df_players[nr, 1],df_players[nr, 2],df_players[nr, 3], sep=" / ")
  }
  return(arr)
}
