# DATA CONNECTOR
file_name <- 'Dataset_Numeric.csv'
DATASET <- try(read.csv(file.path('datasets', file_name)))
if(class(DATASET) != "try-error"){
  DATASET <- read.csv(file.path('datasets', file_name))
} else {
  message(paste("File", file_name, ": doesn't exist, please check"))
}

file_name <- 'Team_ApiName.csv'
TABLE_TEAM_APINAME <- try(read.csv(file.path('datasets', file_name)))
if(class(DATASET) != "try-error"){
  TABLE_TEAM_APINAME <- read.csv(file.path('datasets', file_name))
} else {
  message(paste("File", file_name, ": doesn't exist, please check"))
}

getDataset <- function(){
  if(is.null(DATASET)){
    message("Can't load dataset")
    return(NULL)
  }
  return(DATASET)
}

getTeamApiName <- function(team_name, team_api_name=TABLE_TEAM_APINAME){
  if(team_name == "" || is.null(team_name)){
    return(NULL)
  }
  if(is.null(team_api_name)){
    message("Can't load team api names table")
    return(NULL)
  }
  return(team_api_name[which(team_api_name$team_long_name == team_name), ]$team_api_id)
}


getPlayersTable <- function(team_name){
  if(team_name == "" || is.null(team_name)){
    return(NULL)
  }
  path <- paste('Player_', team_name, '.csv', sep="")
  if(!(path %in% dir(file.path('datasets', 'players')))){
    message("Can't load players table")
    return(NULL)
  }
  path <- file.path('datasets', 'players', paste('Player_', team_name, '.csv', sep=""))
  players_table <- try(read.csv(path))
  if(class(players_table) != "try-error"){
    players_table <- read.csv(path)
    return(players_table)
  } else {
    message(paste("File ", team_name, ": doesn't exist, please check"))
    return(NULL)
  }
}

isApiExist <- function(team_api){
  if(length(which(TABLE_TEAM_APINAME$team_api_id == team_api)) == 0){
    return(FALSE)
  }
  return(TRUE)
}

getLastTactic <- function(team_api, dataset=DATASET){
  if(!isApiExist(team_api)){
    message("team_api isn't exist")
    return(NULL)
  }
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