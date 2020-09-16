# -------------------------------------------------
# Intermediate R - Functions
# 15 set 2020
# VNTBJR
# ------------------------------------------------
# 
# Introdutcion to functions ------------------------------------------------
# Function documentation

# Consult the documentation on the mean() function
help(mean)

# Inspect the arguments of the mean() function
args(mean)

# Use a function
# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate average number of views
avg_li <- mean(linkedin)
avg_fb <- mean(facebook)

# Inspect avg_li and avg_fb
print(avg_li)
print(avg_fb)

# Calculate the mean of the sum
avg_sum <- mean(c(linkedin + facebook))

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(c(linkedin + facebook), trim = 0.2)

# Inspect both new variables
print(avg_sum)
print(avg_sum_trimmed)

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Basic average of linkedin
mean(linkedin)

# Advanced average of linkedin
mean(linkedin, na.rm = TRUE)

# Functions inside functions
# Calculate the mean absolute deviation
mean(abs(linkedin - facebook), na.rm = TRUE)

# Writing Functions ------------------------------------------------
