matches <- subset(matches, select = c(season, away_team_api_id, home_team_api_id, 
                                      H_overall_rating, A_overall_rating, 
                                      H_potential, A_potential, 
                                      H_buildUpPlaySpeedClass, 
                                      H_buildUpPlayDribblingClass,
                                      H_buildUpPlayPassingClass, 
                                      H_buildUpPlayPositioningClass, 
                                      H_chanceCreationPassingClass,
                                      H_chanceCreationCrossingClass, 
                                      H_chanceCreationShootingClass, 
                                      H_chanceCreationPositioningClass,
                                      H_defencePressureClass, 
                                      H_defenceAggressionClass, 
                                      H_defenceTeamWidthClass, 
                                      A_buildUpPlaySpeedClass,
                                      A_buildUpPlayDribblingClass, 
                                      A_buildUpPlayPassingClass, 
                                      A_buildUpPlayPositioningClass, 
                                      A_chanceCreationPassingClass,
                                      A_chanceCreationCrossingClass, 
                                      A_chanceCreationShootingClass, 
                                      A_chanceCreationPositioningClass, 
                                      A_defencePressureClass, 
                                      A_defenceAggressionClass, 
                                      A_defenceTeamWidthClass, 
                                      result
))

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
