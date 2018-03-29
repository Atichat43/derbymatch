# DATA CONNECTOR
OUR_TEAM <- read.csv("./datasets/ManU_player.csv")
DATASET <- read.csv(file.path('datasets', 'data_ngoals_percent_numeric.csv'))

getOurTeam <- function(){
  return(OUR_TEAM)
}

getDataset <- function(){
  return(DATASET)
}