# Exercise 7: using dplyr on external data

# Load the dplyr library
library(dplyr)

# Use the `read.csv()` function to read in the included data set. Remember to
# save it as a variable.
team.data <- read.csv("data/nba_teams_2016.csv", stringsAsFactors=FALSE)

# View the data frame you loaded, and get some basic information about the 
# number of rows/columns. 
# Note the "X" preceding some of the column titles as well as the "*" following
# the names of teams that made it to the playoffs that year.
View(team.data)

# Add a column that gives the turnovers to steals ratio (TOV / STL) for each team
team.data <- mutate(team.data, Ratio = TOV / STL)

# Sort the teams from lowest turnover/steal ratio to highest
# Which team has the lowest ratio?
team.data <- arrange(team.data, Ratio)
team.data[1,"Team"]

# Using the pipe operator, create a new column of assists per game (AST / G) 
# AND sort the data.frame by this new column in descending order.
team.data <- mutate(team.data, ASTGM = AST / G) %>% arrange(-ASTGM)

# Create a data frame called `good.offense` of teams that scored more than 
# 8700 points (PTS) in the season
good.offense <- filter(team.data, PTS > 8700)

# Create a data frame called `good.defense` of teams that had more than 
# 470 blocks (BLK)
good.defense <- filter(team.data, BLK > 470)

# Create a data.frame called `offense.stats` that only shows offensive 
# rebounds (ORB), field-goal % (FG.), and assists (AST) along with the team name.
offense.stats <- select(team.data, Team, ORB, FG., AST)

# Create a data frame called `defense.stats` that only shows defensive 
# rebounds (DRB), steals (STL), and blocks (BLK) along with the team name.
defense.stats <- select(team.data, Team, DRB, STL, BLK)

# Create a function called `BetterShooters` that takes in two teams and returns
# a data frame of the team with the better field-goal percentage. Include the team name, field-goal percentage, and total points in your resulting data frame
BetterShooters <- function(team1, team2) {
  better.team <- filter(team.data, Team %in% c(team1, team2)) %>% 
    filter(FG. == max(FG.)) %>%
    select(Team, FG., PTS)
  
  return (better.team)
}

# Call the function on two teams to compare them (remember the `*` if needed)
better.shooter <- BetterShooters("Golden State Warriors*", "Cleveland Cavaliers*")
better.shooter
