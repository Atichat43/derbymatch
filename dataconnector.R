# DATA CONNECTOR
DATASET <- read.csv(file.path('datasets', 'Dataset_Numeric.csv'))
TABLE_TEAM_APINAME <- read.csv(file.path('datasets', 'Team_ApiName.csv'))

getDataset <- function(){
  return(DATASET)
}

getTeamApiName <- function(team_name, team_api_name=TABLE_TEAM_APINAME){
  return(team_api_name[which(team_api_name$team_long_name == team_name), ]$team_api_id)
}

getPlayersTable <- function(team_name){
  return(read.csv(file.path('datasets', 'players', paste('Player_', team_name, '.csv', sep=""))))
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

getCompare <- function(p1, p2){
  df <- cbind(t(p1),t(p2))
  df <- cbind(c(rownames(df)), df)
  colnames(df) <- c("label", "HomeTeam", "AwayTeam")
  rownames(df) <- 1:nrow(df)
  lables <- df[,1]
  df <- cbind(lables, apply(df[,2:3], 2, as.numeric))
  return(df)
}
