context("test-womens_stats")

skip_if_no_cookie <- function() {
  if (is.null(get_aflw_cookie())) {
    skip("AFLW Cookie not working")
  }
}


test_that("get_aflw_cookie returns a 32 character string", {
  skip_if_no_cookie()
  expect_type(get_aflw_cookie(), "character")
  expect_equal(nchar(get_aflw_cookie()), 32)
  expect_error(get_aflw_cookie("a"))
})

test_that("get_aflw_rounds returns data frame with correct variables", {
  skip_if_no_cookie()
  expect_type(get_aflw_rounds(get_aflw_cookie()), "list")
  expect_equal(
    colnames(get_aflw_rounds(get_aflw_cookie())),
    c(
      "name", "id", "roundPhase", "currentRoundId", "name1",
      "year", "season", "roundId", "abbreviation", "competitionId",
      "roundNumber", "guid"
    )
  )
})

test_that("get_aflw_round_data returns data frame with correct variables", {
  skip_if_no_cookie()
  expect_type(get_aflw_round_data("CD_R201826401", get_aflw_cookie()), "list")
  expect_equal(
    colnames(get_aflw_round_data(
      "CD_R201826401",
      get_aflw_cookie()
    )),
    c(
      "Match.Id", "Round.Id", "Competition.Id", "Venue",
      "Local.Start.Time", "Round.Number", "Round.Abbreviation",
      "Weather.Type", "Weather.Description", "Temperature",

      "Home.Team", "Home.Goals", "Home.Behinds", "Home.Points",
      "Home.Left.Behinds", "Home.Right.Behinds", "Home.Left.Posters",
      "Home.Right.Posters", "Home.Rushed.Behinds",
      "Home.Touched.Behinds",

      "Away.Team", "Away.Goals", "Away.Behinds", "Away.Points",
      "Away.Left.Behinds", "Away.Right.Behinds", "Away.Left.Posters",
      "Away.Right.Posters", "Away.Rushed.Behinds",
      "Away.Touched.Behinds"
    )
  )
})

test_that("get_aflw_match_data returns dataframe with correct variables", {
  skip_if_no_cookie()
  expect_type(get_aflw_match_data(), "list")
  expect_equal(
    colnames(get_aflw_match_data()),
    c(
      "Match.Id", "Round.Id", "Competition.Id", "Venue",
      "Local.Start.Time", "Round.Number", "Round.Abbreviation",
      "Weather.Type", "Weather.Description", "Temperature",

      "Home.Team", "Home.Goals", "Home.Behinds", "Home.Points",
      "Home.Left.Behinds", "Home.Right.Behinds", "Home.Left.Posters",
      "Home.Right.Posters", "Home.Rushed.Behinds",
      "Home.Touched.Behinds",

      "Away.Team", "Away.Goals", "Away.Behinds", "Away.Points",
      "Away.Left.Behinds", "Away.Right.Behinds", "Away.Left.Posters",
      "Away.Right.Posters", "Away.Rushed.Behinds",
      "Away.Touched.Behinds"
    )
  )
  expect_type(get_aflw_match_data(start_year = 2018), "list")
})

test_that("get_aflw_detailed_match_data returns dataframe with correct vars", {
  skip_if_no_cookie()
  expect_type(get_aflw_detailed_match_data(
    "CD_M20172640101",
    "CD_R201726401",
    "CD_S2017264",
    get_aflw_cookie()
  ), "list")
})

test_that("get_afwl_detailed_data returns dataframe", {
  skip_if_no_cookie()
  expect_type(
    get_aflw_detailed_data(c(
      "CD_M20172640101",
      "CD_M20172640102"
    )),
    "list"
  )
})
