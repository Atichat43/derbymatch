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
