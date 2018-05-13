# DATA CONNECTOR
DATASET <- read.csv(file.path('datasets', 'Dataset_Numeric.csv'))
TABLE_TEAM_APINAME <- read.csv(file.path('datasets', 'Team_ApiName.csv'))

getDataset <- function(){
  return(DATASET)
}

getTeamApiName <- function(team_name, team_api_name=TABLE_TEAM_APINAME){
  return(team_api_name[which(team_api_name$team_long_name == team_name), ]$team_api_id)
}

getLastTactic <- function(team_api, dataset=DATASET){
  start_ncol_h <- which(colnames(dataset[1, ]) == "H_buildUpPlaySpeedClass")
  start_ncol_a <- which(colnames(dataset[1, ]) == "A_buildUpPlaySpeedClass")
  for(nr in nrow(dataset):1){
    if(dataset$home_team_api_id[nr] == team_api && dataset$away_team_api_id[nr] == MANUNITED_API){
      last_tactic <- dataset[nr, start_ncol_h:(start_ncol_h + 10)]
      break
    }  
    else if(dataset$away_team_api_id[nr] == team_api && dataset$home_team_api_id[nr] == MANUNITED_API){
      last_tactic <- dataset[nr, start_ncol_h:(start_ncol_h+10)]
      break
    }
  }
  return(last_tactic)
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

getCompare <- function(p1, p2){
  df <- cbind(t(p1),t(p2))
  df <- cbind(c(rownames(df)), df)
  colnames(df) <- c("label","HomeTeam", "AwayTeam")
  rownames(df) <- 1:nrow(df)
  lables <- df[,1]
  df <- cbind(lables, apply(df[,2:3], 2, as.numeric))
  return(df)
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