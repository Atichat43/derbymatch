dataset = read.csv(file.path('datasets', 'rawdata', 'match_info.csv'))

dataset = subset(dataset, select = c(away_team_api_id,home_team_api_id,H_overall_rating,
                                     + A_overall_rating, H_potential, A_potential, H_buildUpPlaySpeedClass, H_buildUpPlayDribblingClass,
                                     + H_buildUpPlayPassingClass, H_buildUpPlayPositioningClass, H_chanceCreationPassingClass,
                                     + H_chanceCreationCrossingClass, H_chanceCreationShootingClass, H_chanceCreationPositioningClass,
                                     + H_defencePressureClass, H_defenceAggressionClass, H_defenceTeamWidthClass, A_buildUpPlaySpeedClass,
                                     + A_buildUpPlayDribblingClass, A_buildUpPlayPassingClass, A_buildUpPlayPositioningClass, A_chanceCreationPassingClass,
                                     + A_chanceCreationCrossingClass, A_chanceCreationShootingClass, A_chanceCreationPositioningClass, 
                                     + A_defencePressureClass, A_defenceAggressionClass, A_defenceTeamWidthClass, result
))


##Missing Value
dataset$H_overall_rating = ifelse(is.na(dataset$H_overall_rating),
                                  ave(dataset$H_overall_rating, FUN = function(x) mean(x, na.rm = TRUE)),
                                  dataset$H_overall_rating)

dataset$A_overall_rating = ifelse(is.na(dataset$A_overall_rating),
                                  ave(dataset$A_overall_rating, FUN = function(x) mean(x, na.rm = TRUE)),
                                  dataset$A_overall_rating)

dataset$H_potential= ifelse(is.na(dataset$H_potential),
                            ave(dataset$H_potential, FUN = function(x) mean(x, na.rm = TRUE)),
                            dataset$H_potential)

dataset$A_potential= ifelse(is.na(dataset$A_potential),
                            ave(dataset$A_potential, FUN = function(x) mean(x, na.rm = TRUE)),
                            dataset$A_potential)

## Encoding categorical data
dataset$H_buildUpPlayDribblingClass = factor(dataset$H_buildUpPlayDribblingClass,
                                             levels = c('Little', 'Normal'),
                                             labels = c(1, 2))

dataset$A_buildUpPlayDribblingClass = factor(dataset$A_buildUpPlayDribblingClass,
                                             levels = c('Little', 'Normal'),
                                             labels = c(1, 2))

dataset$H_buildUpPlaySpeedClass = factor(dataset$H_buildUpPlaySpeedClass,
                                         levels = c('Slow', 'Balanced','Fast'),
                                         labels = c(1, 2,3))

dataset$A_buildUpPlaySpeedClass = factor(dataset$A_buildUpPlaySpeedClass,
                                         levels = c('Slow', 'Balanced','Fast'),
                                         labels = c(1, 2,3))

dataset$H_buildUpPlayPassingClass = factor(dataset$H_buildUpPlayPassingClass,
                                           levels = c('Short', 'Mixed','Long'),
                                           labels = c(1, 2,3))

dataset$A_buildUpPlayPassingClass = factor(dataset$A_buildUpPlayPassingClass,
                                           levels = c('Short', 'Mixed','Long'),
                                           labels = c(1, 2,3))

dataset$H_buildUpPlayPositioningClass = factor(dataset$H_buildUpPlayPositioningClass,
                                               levels = c('Free Form', 'Organised'),
                                               labels = c(1, 2))

dataset$A_buildUpPlayPositioningClass = factor(dataset$A_buildUpPlayPositioningClass,
                                               levels = c('Free Form', 'Organised'),
                                               labels = c(1, 2))

dataset$H_chanceCreationPassingClass = factor(dataset$H_chanceCreationPassingClass,
                                              levels = c('Safe', 'Normal','Risky'),
                                              labels = c(1, 2,3))

dataset$A_chanceCreationPassingClass = factor(dataset$A_chanceCreationPassingClass,
                                              levels = c('Safe', 'Normal','Risky'),
                                              labels = c(1, 2,3))

dataset$H_chanceCreationCrossingClass = factor(dataset$H_chanceCreationCrossingClass,
                                               levels = c('Little', 'Normal','Lots'),
                                               labels = c(1, 2,3))

dataset$A_chanceCreationCrossingClass = factor(dataset$A_chanceCreationCrossingClass,
                                               levels = c('Little', 'Normal','Lots'),
                                               labels = c(1, 2,3))

dataset$H_chanceCreationShootingClass = factor(dataset$H_chanceCreationShootingClass,
                                               levels = c('Little', 'Normal','Lots'),
                                               labels = c(1, 2,3))

dataset$A_chanceCreationShootingClass = factor(dataset$A_chanceCreationShootingClass,
                                               levels = c('Little', 'Normal','Lots'),
                                               labels = c(1, 2,3))

dataset$H_chanceCreationPositioningClass = factor(dataset$H_chanceCreationPositioningClass,
                                                  levels = c('Free Form', 'Organised'),
                                                  labels = c(1, 2))

dataset$A_chanceCreationPositioningClass = factor(dataset$A_chanceCreationPositioningClass,
                                                  levels = c('Free Form', 'Organised'),
                                                  labels = c(1, 2))


dataset$H_defencePressureClass = factor(dataset$H_defencePressureClass,
                                        levels = c('Deep', 'Medium','High'),
                                        labels = c(1, 2,3))

dataset$A_defencePressureClass = factor(dataset$A_defencePressureClass,
                                        levels = c('Deep', 'Medium','High'),
                                        labels = c(1, 2,3))


dataset$H_defenceAggressionClass = factor(dataset$H_defenceAggressionClass,
                                          levels = c('Contain', 'Double','Press'),
                                          labels = c(1, 2,3))

dataset$A_defenceAggressionClass = factor(dataset$A_defenceAggressionClass,
                                          levels = c('Contain', 'Double','Press'),
                                          labels = c(1, 2,3))


dataset$H_defenceTeamWidthClass = factor(dataset$H_defenceTeamWidthClass,
                                         levels = c('Narrow', 'Normal','Wide'),
                                         labels = c(1, 2,3))

dataset$A_defenceTeamWidthClass = factor(dataset$A_defenceTeamWidthClass,
                                         levels = c('Narrow', 'Normal','Wide'),
                                         labels = c(1, 2,3))

dataset$result = factor(dataset$result,
                        levels = c('draw', 'win','lose'),
                        labels = c(1, 2,3))
