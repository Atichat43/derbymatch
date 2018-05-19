context("Testing: ...Dataconnector")
test_that("getDataset: is dataframe", {
  dataset <- getDataset()
  expect_that(dataset, is_a("data.frame"))
})

test_that("getTeamApiName: return value", {
  expect_that(is.null(getTeamApiName('')), is_true())
  expect_that(getTeamApiName('Liverpool'), is_a("integer"))
  expect_that(length(getTeamApiName('Liverpool')), equals(1))
  expect_that(length(getTeamApiName('Li')), equals(0))
})

test_that("getPlayersTable:", {
  expect_that(is.null(getPlayersTable('')), is_true())
  expect_that(is.null(getPlayersTable('Li')), is_true())
  for(di in dir(file.path('datasets', 'players'))){
    str <- unlist(strsplit(di, "_"))
    str <- unlist(strsplit(str[2], "\\."))
    str <- str[1]
    expect_that(getPlayersTable(str), is_a("data.frame"))
  }
})

test_that("isApiExist: ", {
  for(di in dir(file.path('datasets', 'players'))){
    str <- unlist(strsplit(di, "_"))
    str <- unlist(strsplit(str[2], "\\."))
    str <- str[1]
    expect_that(isApiExist(getTeamApiName(str)), is_true())
  }
  expect_that(isApiExist(getTeamApiName('Liverpool')), is_a("logical"))
  expect_that(isApiExist(getTeamApiName('Li')), is_false())
  expect_that(isApiExist('s'), is_false())
  expect_that(isApiExist(5), is_false())
})

test_that("getLastTactic:", {
  tactic <- getLastTactic(getTeamApiName('Liverpool'))
  expect_that(tactic, is_a("data.frame"))
  expect_that(length(names(tactic)), equals(11))
  expect_that(getLastTactic(5), shows_message("team_api isn't exist"))
  expect_that(getLastTactic(""), shows_message("team_api isn't exist"))
})



