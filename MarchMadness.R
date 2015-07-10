# Set working directory.
setwd("C:/Users/e438783/Documents/GitHub/MarchMadness")

# Read in historical data.
teams.df <- read.csv(teams.csv)
seasons.df <- read.csv(seasons.csv)
regular_season_compact.df <- read.csv(regular_season_compact_results.csv)  #Regular season compact results thru 2014
regular_season_detail.df <- read.csv(regular_season_detail_results.csv)  #Regular season detail results thru 2014
tourney_compact.df <- read.csv(tourney_compact_results.csv)  #Tourney compact results thru 2014
tourney_detail.df <- read.csv(tourney_detail_results.csv)  #Tourney detail results thru 2014
tourney_seeds.df <- read.csv(tourney_seeds.csv)  #Tourney seeds thru 2014
tourney_slots.df <- read.csv(tourney_slots.csv)  #Tourney slots thru 2014

# Read in 2015 data.
regular_season_compact_2015.df <- read.csv(regular_season_compact_results_2015.csv)
regular_season_detail_2015.df <- read.csv(regular_season_detail_results_2015.csv)
tourney_compact_2015.df <- read.csv(tourney_compact_results_thru_2015.csv)  #Tourney compact results thru 2015
tourney_detail_2015.df <- read.csv(tourney_detail_results_thru_2015.csv)  #Tourney detail results thru 2015
tourney_seeds_2015.df <- read.csv(tourney_seeds_2015.csv)  #Tourney seeds for 2015
tourney_slots_2015.df <- read.csv(tourney_slots_2015.csv)  #Tourney slots for 2015