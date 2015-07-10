# Set working directory.
setwd("C:/Users/e438783/Documents/GitHub/MarchMadness")

# Read in historical data
teams.df <- read.csv("teams.csv", header = TRUE, stringsAsFactors = FALSE)
seasons.df <- read.csv("seasons.csv", header = TRUE, stringsAsFactors = FALSE)
regular_season_compact.df <- read.csv("regular_season_compact_results.csv", header = TRUE, stringsAsFactors = FALSE)  #Regular season compact results thru 2014
regular_season_detail.df <- read.csv("regular_season_detail_results.csv", header = TRUE, stringsAsFactors = FALSE)  #Regular season detail results thru 2014
tourney_compact.df <- read.csv("tourney_compact_results.csv", header = TRUE, stringsAsFactors = FALSE)  #Tourney compact results thru 2014
tourney_detail.df <- read.csv("tourney_detail_results.csv", header = TRUE, stringsAsFactors = FALSE)  #Tourney detail results thru 2014
tourney_seeds.df <- read.csv("tourney_seeds.csv", header = TRUE, stringsAsFactors = FALSE)  #Tourney seeds thru 2014
tourney_slots.df <- read.csv("tourney_slots.csv", header = TRUE, stringsAsFactors = FALSE)  #Tourney slots thru 2014

# Read in 2015 data
regular_season_compact_2015.df <- read.csv("regular_season_compact_results_2015.csv", header = TRUE, stringsAsFactors = FALSE)
regular_season_detail_2015.df <- read.csv("regular_season_detail_results_2015.csv", header = TRUE, stringsAsFactors = FALSE)
tourney_compact_2015.df <- read.csv("tourney_compact_results_thru_2015.csv", header = TRUE, stringsAsFactors = FALSE)  #Tourney compact results thru 2015
tourney_detail_2015.df <- read.csv("tourney_detail_results_thru_2015.csv", header = TRUE, stringsAsFactors = FALSE)  #Tourney detail results thru 2015
tourney_seeds_2015.df <- read.csv("tourney_seeds_2015.csv", header = TRUE, stringsAsFactors = FALSE)  #Tourney seeds for 2015
tourney_slots_2015.df <- read.csv("tourney_slots_2015.csv", header = TRUE, stringsAsFactors = FALSE)  #Tourney slots for 2015

# Explore the data
names(seasons.df)  #column names of dataset
names(teams.df)

str(seasons.df)  #overview of dataset
str(teams.df)
