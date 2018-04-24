# DATA CONNECTOR
OUR_TEAM <- read.csv("./datasets/ManU_player.csv")
DATASET <- read.csv(file.path('datasets', 'data_ngoals_percent_numeric.csv'))
team_api_name <- read.csv(file.path('datasets', 'Team_api_name.csv'))

getOurTeam <- function(){
  return(OUR_TEAM)
}

getDataset <- function(){
  return(DATASET)
}

getPlayers <- function(teamName, lst_api = c("")){
  table_players <- read.csv(file.path('datasets', 'players', paste('Player_', teamName, '.csv', sep="")))
  #table_players <- subset(table_players, select = c(player_name, player_position, player_number))
  if(lst_api != ""){
    lst_api <- as.data.frame(lst_api)
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


getPlayerStat <- function(teamName, api){
  table_players <- read.csv(file.path('datasets', 'players', paste('Player_', teamName, '.csv', sep="")))
  temp <- table_players[1, ]
  for(nr in 1:nrow(table_players)){
    if(api == table_players$player_api_id[nr]){
      temp <- table_players[nr, ]
      break
    }
  }
  temp <- subset(temp, select = c("dribbling", "long_shots", "acceleration", "strength", "stamina", "crossing"))
  return(temp)
}


toStringPlayers <- function(players, n = 3){
  arr <- as.array(as.character(1:nrow(players)))
  for(nr in 1:nrow(players)){
    if(n == 3){
      arr[nr] <- paste(as.character(players$player_name[nr]), as.character(players$player_position[nr]), as.character(players$player_number[nr]), sep=" / ")
    }
    else if(n == 1){
      arr[nr] <- as.character(players$player_name[nr])
    }
    else{}
  }
  return(arr)
}

apiPlayers <- function(players){
  api <- as.array(as.character(1:nrow(players)))
  for(nr in 1:nrow(players)){
    api[nr] <- as.character(players$player_api_id[nr])
  }
  return(api)
}