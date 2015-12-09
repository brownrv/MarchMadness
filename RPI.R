# Calculating Rating Percentage Index (RPI)
#  https://en.wikipedia.org/wiki/Rating_Percentage_Index
#  http://rpiratings.com/WhatisRPI.php

# RPI = (0.25)*(WP) + (0.50)*(OWP) + (0.25)*(OOWP)
# where
# WP = Team Winning Percentage
# OWP = Opponents' Winning Percentage
# OOWP = Opponents' Opponents' Winning Percentage


# WP

# Away wins are more important than Home wins. 
# Thus your overall number of "effective" wins is calculated as 
# EW = (1.4)*(Away wins) + (1.0)*(Neutral wins) + (0.6)*(Home wins),
# and your overall number of "effective" losses is calculated as 
# EL = (1.4)*(Home losses) + (1.0)*(Neutral losses) + (0.6)*(Away losses). 
# Then the formula for WP is just (effective wins)/(effective wins + effective losses).


# OWP

# excludes games against the team whose RPI is being calculated


# OOWP


# Example : 2014 Arizona St (team_id 1113)

# regular_season_compact.df
# "season" = 2014
# "wteam" = 1113
# "lteam" = 1113
# "wloc" = "H" "N" "A"

#season <- 1985  # choose season
#team <- 1113  # choose team

# http://stackoverflow.com/questions/23000661/how-to-realize-countifs-function-excel-in-r
#home_wins <- sum(regular_season_compact.df$season == season & regular_season_compact.df$wteam == team & regular_season_compact.df$wloc == "H")
#neutral_wins <- sum(regular_season_compact.df$season == season & regular_season_compact.df$wteam == team & regular_season_compact.df$wloc == "N")
#away_wins <- sum(regular_season_compact.df$season == season & regular_season_compact.df$wteam == team & regular_season_compact.df$wloc == "A")
#home_losses <- sum(regular_season_compact.df$season == season & regular_season_compact.df$lteam == team & regular_season_compact.df$wloc == "A")
#neutral_losses <- sum(regular_season_compact.df$season == season & regular_season_compact.df$lteam == team & regular_season_compact.df$wloc == "N")
#away_losses <- sum(regular_season_compact.df$season == season & regular_season_compact.df$lteam == team & regular_season_compact.df$wloc == "H")

#EW <- 0.6 * home_wins + 1.0 * neutral_wins + 1.4 * away_wins
#EL <- 1.4 * home_losses + 1.0 * neutral_losses + 0.6 * away_losses
#EWP <- EW / (EW + EL)

###

regular_season_rpi.m <- matrix(ncol = 6, nrow = 10920)
colnames(regular_season_rpi.m) <- c("season", "team", "WP", "OWP", "OOWP", "RPI")
regular_season_rpi.df <- data.frame(regular_season_rpi.m)

index <- 0
for (i in 1985:2014){
  for (j in 1101:1464) {
    index <- index + 1
    regular_season_rpi.df$season[index] <- i
    regular_season_rpi.df$team[index] <- j
    
    home_wins <- sum(regular_season_compact.df$season == i & regular_season_compact.df$wteam == j & regular_season_compact.df$wloc == "H", na.rm=TRUE)
    neutral_wins <- sum(regular_season_compact.df$season == i & regular_season_compact.df$wteam == j & regular_season_compact.df$wloc == "N", na.rm=TRUE)
    away_wins <- sum(regular_season_compact.df$season == i & regular_season_compact.df$wteam == j & regular_season_compact.df$wloc == "A", na.rm=TRUE)
    home_losses <- sum(regular_season_compact.df$season == i & regular_season_compact.df$lteam == j & regular_season_compact.df$wloc == "A", na.rm=TRUE)
    neutral_losses <- sum(regular_season_compact.df$season == i & regular_season_compact.df$lteam == j & regular_season_compact.df$wloc == "N", na.rm=TRUE)
    away_losses <- sum(regular_season_compact.df$season == i & regular_season_compact.df$lteam == j & regular_season_compact.df$wloc == "H", na.rm=TRUE)
    
    EW <- 0.6 * home_wins + 1.0 * neutral_wins + 1.4 * away_wins
    EL <- 1.4 * home_losses + 1.0 * neutral_losses + 0.6 * away_losses
    regular_season_rpi.df$WP[index] <- EW / (EW + EL)
    
    #regular_season_rpi.df$OWP[index] <- 0
    #regular_season_rpi.df$OOWP[index] <- 0
        
  }
}

index <- 0
for (i in 1985:2014){
  for (j in 1101:1464) {
    index <- index + 1

    opponents.df <- subset(regular_season_compact.df, season == i & wteam == j)
    opponents.teams <- opponents.df$lteam
    opponents.df <- subset(regular_season_compact.df, season == i & lteam == j)
    opponents.teams <- c(opponents.teams, opponents.df$wteam)
    opponents.wp <- vector(mode="numeric", length=0)
    
    for (k in 1:length(opponents.teams)) {
      w <- sum(regular_season_compact.df$season == i & regular_season_compact.df$wteam == opponents.teams[k])
      x <- sum(regular_season_compact.df$season == i & regular_season_compact.df$lteam == opponents.teams[k])
      y <- sum(regular_season_compact.df$season == i & regular_season_compact.df$wteam == opponents.teams[k] & regular_season_compact.df$lteam == j)
      z <- sum(regular_season_compact.df$season == i & regular_season_compact.df$wteam == j & regular_season_compact.df$lteam == opponents.teams[k])
    
      opponents.wp <- c(opponents.wp, (w-y)/((w-y)+(x-z)))
    
    }
    
    regular_season_rpi.df$OWP[index] <- mean(opponents.wp)    
  }
}

index <- 0
for (i in 1985:2014) {
  for (j in 1101:1464) {
    index <- index + 1
    
    opponents.df <- subset(regular_season_compact.df, season == i & wteam == j)
    opponents.teams <- opponents.df$lteam
    opponents.df <- subset(regular_season_compact.df, season == i & lteam == j)
    opponents.teams <- c(opponents.teams, opponents.df$wteam)
    opp_opp.owp <- vector(mode="numeric", length=0)
    
    for (k in 1:length(opponents.teams)) {
      opp_opp.owp <- c(opp_opp.owp, regular_season_rpi.df$OWP[regular_season_rpi.df$season == i & regular_season_rpi.df$team == opponents.teams[k]])      
    }
    regular_season_rpi.df$OOWP[index] <- mean(opp_opp.owp)
  }
}

for (i in 1:10920) {
  regular_season_rpi.df$RPI[i] <- .25 * regular_season_rpi.df$WP[i] + .50 * regular_season_rpi.df$OWP[i] + .25 * regular_season_rpi.df$OOWP[i]
}

write.csv(regular_season_rpi.df, file = "regular_season_rpi.csv")

###
