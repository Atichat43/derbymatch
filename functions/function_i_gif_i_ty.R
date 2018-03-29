matchs <- subset(matchs, select = c(season, away_team_api_id, home_team_api_id, 
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

getTactic <- function(teamApi){
  for(nr in nrow(matchs):1){
    if(matchs$away_team_api_id[nr] == teamApi){
      tactic <- matchs[nr, 8:18]
      break
    }  
    else if(matchs$home_team_api_id[nr] == teamApi){
      tactic <- matchs[nr, 19:29]
      break
    }
  }
  return(tactic)
}

getTeamApi <- function(teamName){
  return(team_api_name[which(team_api_name$team_long_name == teamName), ]$team_api_id)
}

