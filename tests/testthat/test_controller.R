context('Testing: ...Controller')
test_that("createDefaultTactic:", {
  tactic <- createDefaultTactic()
  expect_that(tactic, is_a("data.frame"))
  expect_that(length(tactic), equals(11))
  for(e in 1:length(tactic)){
    expect_that(tactic[, e], equals(1))
  }
})

test_that("getTeamApi:", {
  expect_that(is.null(getTeamApi('')), is_true())
  expect_that(length(getTeamApi('L')), equals(0))
  expect_that(length(getTeamApi('Liverpool')), equals(1))
})

test_that("getTactic: ", {
  expect_that(getTactic(''), shows_message("team_api isn't exist"))
  expect_that(getTactic('Li'), shows_message("team_api isn't exist"))
  tactic <- getTactic(getTeamApi('Liverpool'))
  expect_that(length(tactic), equals(11))
  expect_that(tactic, is_a("data.frame"))
})

test_that("getPlayers: ", {
  # expect_that(is.null(getPlayers('')), is_true())
  # expect_that(is.null(getPlayers('Li')), is_true())
  expect_that(is.null(getPlayers('')), is_true())
  expect_that(getPlayers('Li'), shows_message("Can't load players table"))
  # players <- getPlayers('Liverpool')
  # expect_that(players, is_a("data.frame"))
  # players_temp <- getPlayersTable('Liverpool')
  # expect_that(players, is_equivalent_to(players_temp))
  # expect_that(length(players), equals(length(players_temp)))
  # for(sample_size in seq(1, 9, by = 2)){
  #   lst_player_id <- sample(players_temp$player_api_id, sample_size)
  #   players <- getPlayers('Liverpool', lst_player_id)
  #   expect_that(nrow(players), equals(sample_size))
  # }
})

test_that("getPlayerStat: ", {
  expect_that(is.null(getPlayerStat('', '')), is_true())
  expect_that(is.null(getPlayerStat('Li', '')), is_true())
  expect_that(is.null(getPlayerStat('', 'Li')), is_true())
  expect_that(getPlayerStat('Li', 543), shows_message("Can't load players table"))
  # expect_that(getPlayerStat('Liverpool', 543), shows_message("Can't load players table"))
  # players <- getPlayersTable('Liverpool')
  # stat <- getPlayerStat('Liverpool', sample(players$player_api_id, 1))
  # expect_that(stat, is_a("data.frame"))
  # expect_that(length(stat), equals(6))
})

test_that("getOverallRatingPotential", {
  expect_that(is.null(getOverallRatingPotential('', '')), is_true())
  expect_that(is.null(getOverallRatingPotential('Li', '')), is_true())
  expect_that(is.null(getOverallRatingPotential('', 'Li')), is_true())
  expect_that(getOverallRatingPotential('Li', 543), shows_message("Can't load players table"))
})