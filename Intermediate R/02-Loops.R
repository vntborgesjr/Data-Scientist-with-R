m# -------------------------------------------------
# Intermediate R - Loops
# 15 set 2020
# VNTBJR
# ------------------------------------------------
#
# While loop and Break Statement ------------------------------------------------

# Initialize the speed variable
speed <- 64

# Code the while loop
while (speed > 30) {
  print('Slow down!')
  speed <- speed - 7
}

print(speed)

# Extend/adapt the while loop
speed <- 64

while (speed > 30) {
  print(paste('Your speed is', speed))
  if (speed > 48) {
    print('Slow down big time!')
    speed <-  speed - 11
  } else {
    print('Slow down!')
    speed <- speed - 6
  }
}

# Initialize the speed variable
speed <- 88

while (speed > 30) {
  print(paste("Your speed is", speed))
  
  # Break the while loop when speed exceeds 80
  if (speed > 80) {
    break
  }
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}

# Initialize i as 1 
i <- 1

# Code the while loop
while (i <= 10) {
  print(3 * i)
  if ((3 * i) %% 8 == 0) {
    break
  }
  i <- i + 1
}

# For loop and Next statement ------------------------------------------------

# Write a for loop that iterates over all the elements of linkedin and prints out
# every element separately. Do this in two ways: using the loop version 1 and the 
# loop version 2 in the example code above.

# Loop version 1
for (views in linkedin) {
  print(views)
}

# Loop version 2
for (i in 1:length(linkedin)) {
  print(linkedin[i])
}

# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1
for (itens in nyc) {
  print(itens)
}

# Loop version 2
for (i in 1:length(nyc)) {
  print(nyc[[i]])
}

# Loop over a matrix
ttt <- matrix(c('O', NA, 'X', NA, 'O', 'O', 'X', NA, 'X'),
              nrow = 3, byrow = TRUE)
ttt

# define the double for loop
for (i in 1:nrow(ttt)) {
  for (j in 1:ncol(ttt)) {
    print(paste('On row', i, 'and column', j, 'the board contains ', ttt[i, j]))
  }
}

# Mix it up with control flow

# Code the for loop with conditionals
for (li in linkedin) {
  if (li > 10) {
    print('You are popular!')
  } else {
    print('Be more visible!')
  }
  print(li)
}

# Next and break with for loop

# Adapt/extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if (li > 16) {
    print("This is ridiculous, I'm outta here!")
    break
  }
  
  # Add if statement with next
  if (li < 5) {
    print("This is too embarrassing!")
    next
  }
  
  print(li)
}

# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
  if (char == 'r') {
    rcount  <-  rcount + 1
  } else if (char == 'u') {
    break
  } 
}

# Print out rcount
print(rcount)