getMatch <- function(team_a_api, team_b_api){
  a <- which(data$home_team_api_id == team_a_api)
  b <- which(data$away_team_api_id == team_b_api)
  f_ab <- factor(a,b)[which(!is.na(factor(a,b)))]
  f_ab <- as.numeric(as.character(f_ab))
  
  b2 <- which(data$home_team_api_id == team_b_api)
  a2 <- which(data$away_team_api_id == team_a_api)
  f2_ab <- factor(a2,b2)[which(!is.na(factor(a2,b2)))]
  f2_ab <- as.numeric(as.character(f2_ab))
  matches <- sort(c(f_ab, f2_ab), decreasing = TRUE)
  return(matches)
}

accuracy <- function(truth, prediction) {
  new_table <- table(truth, prediction)
  sum(diag(new_table)/sum(new_table))
}

#function fide lose test case 
findLoseTestCaseManU <- function(){
  #dataset
  a <- which(dataset$away_team_api_id == 10260)
  h <- which(dataset$home_team_api_id == 10260)
  temp_a <- dataset[a, ]
  man_u_lose_a <- which(temp_a$result == 2)
  temp_h <- dataset[h, ]
  man_u_lose_h <- which(temp_h$result == 3)
  a_table <- temp_a[man_u_lose_a, ]
  h_table <- temp_h[man_u_lose_h, ]
}

changeNameTeam <- function(){
  for(r in 1:nrow(a_table)){
    #get value team_long_name 
    #a_table$home_team_api_id to find
    n <- TABLE_TEAM_APINAME$team_long_name[which(TABLE_TEAM_APINAME$team_api_id == a_table$home_team_api_id[r])]
    a_table$home_team_api_id[r] <- as.character(n)
  }
  a_table
  
  for(r in 1:nrow(h_table)){
    #get value team_long_name 
    #a_table$home_team_api_id to find
    n <- TABLE_TEAM_APINAME$team_long_name[which(TABLE_TEAM_APINAME$team_api_id == h_table$away_team_api_id[r])]
    h_table$away_team_api_id[r] <- as.character(n)
  }
  h_table
}

