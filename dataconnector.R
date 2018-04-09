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

getPlayers <- function(teamName){
  table_players <- read.csv(file.path('datasets', 'players', paste('Player_', teamName, '.csv', sep="")))
  #table_players <- subset(table_players, select = c(player_name, player_position, player_number))
  return(table_players)
}

toStringPlayers <- function(players){
  arr <- as.array(as.character(1:nrow(players)))
  for(nr in 1:nrow(players)){
    arr[nr] <- paste(as.character(players$player_name[nr]), as.character(players$player_position[nr]), as.character(players$player_number[nr]), sep=" / ")
  }
  return(arr)
}