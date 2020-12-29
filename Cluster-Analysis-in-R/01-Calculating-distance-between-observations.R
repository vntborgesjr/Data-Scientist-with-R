# -------------------------------------------------
# Cluster Analysis - Calculating distance between observations
# 29 dez 2020
# VNTBJR
# ------------------------------------------------
# 
# What is cluster analysis? ------------------------------------------------
# It is a form of exploratory data analysis where observations are divided into
# meaningful groups that share common characteristics (features).

# The flow of cluster analysis
# Pre-process Data - Select Similarity Measures - Cluster - Analyze

# Distance between two observations ------------------------------------------------
# Euclidian Dsitance
library(ggplot2)

# Calculate & plot the distance between two players
two_players <- as.data.frame(matrix(c(5, 15, 4, 10), ncol = 2, 
                                    dimnames = list(c(1, 2), c("x", "y"))))

# Plot the positions of the players
ggplot(two_players, aes(x = x, y = y)) + 
  geom_point() +
  # Assuming a 40x60 field
  lims(x = c(-30,30), y = c(-20, 20))

# Split the players data frame into two observations
player1 <- two_players[1, ]
player2 <- two_players[2, ]

# Calculate and print their distance using the Euclidean Distance formula
player_distance <- sqrt( (player1$x - player2$x)^2 +
                           (player1$y - player2$y)^2 )
player_distance

# Using the dist() function
three_players <- as.data.frame(matrix(c(5, 15, 0, 4, 10, 20), ncol = 2, 
                                    dimnames = list(c(1, 2, 3), c("x", "y"))))

# Calculate the Distance Between two_players
dist_two_players <- dist(two_players)
dist_two_players

# Calculate the Distance Between three_players
dist_three_players <- dist(three_players)
dist_three_players

# The importance of scale ------------------------------------------------
# Effects of scale
three_trees <- trees[c(1, 2, 4), 1:2]

# Calculate distance for three_trees 
dist_trees <- dist(three_trees)

# Scale three trees & calculate the distance  
scaled_three_trees <- scale(three_trees)
dist_scaled_trees <- dist(scaled_three_trees)

# Output the results of both Matrices
print('Without Scaling')
dist_trees

print('With Scaling')
dist_scaled_trees

# Measuring distance for categorical data ------------------------------------------------
# Jacard index - it captures the ration beween the intersection of A and B to
# the union of A and B, or the ration between the number of times the features of 
# both observations are TRUE to the number of times they are ever TRUE.

# Calculating distance between categorical variables
library(dummies)
job_survey <- data.frame(job_satisfaction = c("Low", "Low", "Hi", "Low", "Mid"),
                         is_happy = c("No", "No", "Yes", "No", "No"))
# Dummify the Survey Data
dummy_survey <- dummy.data.frame(job_survey)

# Calculate the Distance
dist_survey <- dist(dummy_survey, method = "binary")

# Print the Original Data
job_survey

# Print the Distance Matrix
dist_survey
