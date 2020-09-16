# -------------------------------------------------
# Intermediate R - Conditionals and Control Flow
# 15 set 2020
# VNTBJR
# ------------------------------------------------
# 
# Relational Operators  ------------------------------------------------

# Equality ==
# Inequality !=
# Less than and greater than < and >
# Less than or equal to and greater than or equal to <= and >=

# Comparison of logicals
TRUE == FALSE

# Comparison of numerics
-6 * 14 != 17 - 101

# Comparison of character strings
'useR' == 'user'

# Compare a logical with a numeric
TRUE == 1

# Comparison of numerics
-6 * 5 + 2 >= -10 + 1

# Comparison of character strings
'raining' <= 'raining dogs'

# Comparison of logicals
TRUE > FALSE

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE, 
                dimnames = list(c('LinkedIn', 'Facebook'), c('Sunday', 'Monday', 'Tuesday',
                                                         'Wednsday', 'Thursday', 'Friday',
                                                         'Saturday')))

# Popular days
linkedin > 15

# Quiet days
linkedin <= 5

# LinkedIn more popular than Facebook
linkedin > facebook

# When does views equal 13?
views == 13

# When is views less than or equal to 14?
views <= 14

# Logical Operators ------------------------------------------------

# AND operator '&'
# OR operator '|'
# NOT operator '!'

# '&' vs '&&', '|' vs '||'
# Examins only the first element

# The linkedin and last variable are already defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
last <- tail(linkedin, 1)

# Is last under 5 or above 10?
last < 5 | last > 10

# Is last between 15 (exclusive) and 20 (inclusive)?
15 < last & last <= 20

# linkedin exceeds 10 but facebook below 10
linkedin > 10 & facebook <=10

# When were one or both visited at least 12 times?
linkedin >= 12 | facebook >= 12

# When is views between 11 (exclusive) and 14 (inclusive)?
11 < views & views <= 14

li_df <- read.table(file = '/Datasets/li_df.txt',
                    header = TRUE, 
                    row.names = 'employee')

# Select the second column, named day2, from li_df: second
second <- li_df$day2

# Build a logical vector, TRUE if value in second is extreme: extremes
extremes <- second > 25 | second < 5

# Count the number of TRUEs in extremes
sum(extremes)

# Conditional Statements ------------------------------------------------

# if statement
# else statement
# else if statement

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Examine the if statement for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else {
  print('Unknown medium')
} 

# Write the if statement for num_views
if (num_views > 15) {
  print('You are popular!')
} else {
  print('Try to be more visible!')
}

# Examine the if statement for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == 'Facebook') {
  print('Showing Facebook information')
} else {
  print("Unknown medium")
}

# Write the if statement for num_views
if (num_views > 15) {
  print('You are popular!')
} else if (num_views > 10 & num_views <= 15) {
  print('Your number of views is average')
} else {
  print("Try to be more visible!")
}

# Variables related to your last day of recordings
li <- 15
fb <- 9

# Code the control-flow construct
if (li >= 15 & fb >= 15) {
  sms <- 2 * (li + fb)
} else if (li < 10 & fb < 10) {
  sms <- 0.5 * (li + fb)
} else {
  sms <- li + fb
}

# Print the resulting sms to the console
print(sms)