# --------------------------------------------------- 
# Intermediate R - Useful Functions 
# 17 set 2020 
# VNTBJR 
# --------------------------------------------------- 
#
# Mathematical utilities  -------------------------------------------
# The errors vector has already been defined for you
errors <- c(1.9, -2.6, 4.0, -9.5, -3.4, 7.3)

# Sum of absolute rounded values of errors
sum(abs(round(errors)))

# Don't edit these two lines
vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)

# Fix the error
mean(c(abs(vec1), abs(vec2)))

# Data utilities
# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- unlist(linkedin)
fb_vec <- unlist(facebook)

# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec, fb_vec)

# Sort social_vec
sort(social_vec, decreasing = TRUE)

# Find the error
# Fix me
seq(rep(1, 7, by = 2), times = 7)
rep(seq(1, 7, by = 2), times = 7)

# Beat Gauss using R
# Create first sequence: seq1
seq1 <- seq(1, 500, by = 3)

# Create second sequence: seq2
seq2 <- seq(1200, 900, by = -7)

# Calculate total sum of the sequences
sum(c(seq1, seq2))
 
######################################################################

# Regular expressions  -------------------------------------------
# Pattern existence 
# grepl()
# grepl(pattern = "^a", x = animals) - match for strings that start with 
# an "a"
# grepl(pattern = "a$", x = animals) - match for strings that end with 
# an "a"
# Check the documentation of egular expressions in R
?regex
# grep() returns a vector of indices of the elements of x that yeld a
# match

# Pattern replacement
# sub(pattern = <regex>, replacement = <str>, x = <str>) - replace the 
# the indicated pattern by the new character(s) in object x. It 
# recognizes the first indicated pattern in a string and stops the search
# gsub(pattern = <regex>, replacement = <str>, x = <str>). replace the 
# the indicated pattern by the new character(s) in object x. It 
# recognizes the all indicated pattern in a string and stops the search
# Pattern extraction

# Metacharacter
# @, because a valid email must contain an at-sign.
# .*, which matches any character (.) zero or more times (*). Both the 
# dot and the asterisk are metacharacters. You can use them to match 
# any character between the at-sign and the ".edu" portion of an email
# address.
# \\.edu$, to match the ".edu" part of the email at the end of the 
# string. The \\ part escapes the dot: it tells R that you want to use
# the . as an actual character.

# .*: A usual suspect! It can be read as "any character that is matched 
# zero or more times".
# \\s: Match a space. The "s" is normally a character, escaping it (\\) 
# makes it a metacharacter.
# [0-9]+: Match the numbers 0 to 9, at least once (+).
# ([0-9]+): The parentheses are used to make parts of the matching 
# string available to define the replacement. The \\1 in the 
# replacement argument of sub() gets set to the string that is captured
# by the regular expression [0-9]+.
# grepl() & grep()
# The emails vector has already been defined
emails <- c("john.doe@ivyleague.edu", "education@world.gov", 
            "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", 
            "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl(pattern = "edu", x = emails)

# Use grep() to match for "edu", save result to hits
hits <- grep(pattern = "edu", x = emails)

# Subset emails using hits
emails[hits]

# Use grepl() to match for .edu addresses more robustly
grepl(pattern = "@.*\\.edu$", x = emails)

# Use grep() to match for .edu addresses more robustly, save result to
# hits
hits <- grep(pattern = "@.*\\.edu$", x = emails)

# Subset emails using hits
emails[hits]

# sub() & gsub()
# Use sub() to convert the email domains to datacamp.edu
sub(pattern = "@.*\\.edu$", replacement = "@datacamp.edu", x = emails)

awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")

sub(pattern = ".*\\s([0-9]+)\\snomination.*$", replacement = "\\1", 
    x = awards)

######################################################################

# Times & Dates  -------------------------------------------
# Today Date and time
(today <- Sys.Date())
class(today)
(now <- Sys.time())
class(now) # compactible with other operation systems

# Create Date objects
(my_date <- as.Date("1971-05-14"))
class(my_date)
(my_date <- as.Date("1971-14-05", format = "%Y-%d-%m"))
class(my_date)

# Create POSIXct objects
(my_time <- as.POSIXct(("1971-05-14 11:25:15")))
class(my_time)

# Date arithmetic
my_date + 1
(my_date2 <- as.Date("1998-09-29"))
my_date2 - my_date

# POSIXct arithmetic
my_time + 1
(my_time2 <- as.POSIXct("1974-07-14 21:11:55 CET"))
my_time2 - my_time

# Under the hood
unclass(my_date)

# R Packages
# lubridate
# zoo
# xts

# Exercises - Right here, rigth now
# Get the current date: today
today <- Sys.Date()

# See what today looks like under the hood
unclass(today)

# Get the current time: now
now <- Sys.time()

# See what now looks like under the hood
unclass(now)

# Create and format dates

# %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %B: month (January)
# %b: abbreviated month (Jan)
# %d: 2-digit day of the month (13)
# %A: weekday (monday)
# %a: abbreviated weekday (Mon)

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2)
date3 <- as.Date(str3, format = "%d/%B/%Y")

# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")

# Create and format times
# %H: hours as a decimal number (00-23)
# %I: hours as a decimal number (01-12)
# %M: minutes as a decimal number
# %S: seconds as a decimal number
# %T: shorthand notation for the typical format %H:%M:%S
# %p: AM/PM indicator

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, 
                    format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2)

# Convert times to formatted strings
format(time1, "%M")
format(time2, "%I:%M %p")

# Calculations with dates
day1 <- as.Date("2020-08-31")
day2 <- as.Date("2020-09-02")
day3 <- as.Date("2020-09-07")
day4 <- as.Date("2020-09-13")
day5 <- as.Date("2020-09-18")

# Difference between last and first pizza day
day5 - day1

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)

# Create differences between consecutive pizza days: day_diff
day_diff <- diff(x = pizza)

# Average period between two consecutive pizza days
mean(day_diff)

# Calculations with times
login <- as.POSIXct(c("2020-09-04 10:18:04 UTC",
                      "2020-09-09 09:14:18 UTC",
                      "2020-09-09 12:21:51 UTC", 
                      "2020-09-09 12:37:24 UTC",
                      "2020-09-11 21:37:55 UTC"))
logout <- as.POSIXct(c("2020-09-04 10:56:29 UTC",
                       "2020-09-09 09:14:52 UTC",
                       "2020-09-09 12:35:48 UTC",
                       "2020-09-09 13:17:22 UTC",
                       "2020-09-11 22:08:47 UTC"))

# Calculate the difference between login and logout: time_online
time_online <- logout - login

# Inspect the variable time_online
time_online

# Calculate the total time online
sum(time_online)

# Calculate the average time online
mean(time_online)

# Time is of the essence
astro <- c(spring = "20-Mar-2015", summer = "25-Jun-2015", 
           fall = "23-Sep-2015", winter = "22-Dec-2015")
meteo <- c(spring = "March 1, 2015", summer = "June 1, 2015",
           fall = "September 1, 15", winter = "December 1, 2015")

# Convert astro to vector of Date objects: astro_dates
astro <- as.Date(astro, format = "%d-%b-%Y")

# Convert meteo to vector of Date objects: meteo_dates
meteo <- as.Date(meteo, format = "%B %d, %Y")

# Calculate the maximum absolute difference between astro_dates and 
# meteo_dates
max(abs(astro - meteo))
 
######################################################################
