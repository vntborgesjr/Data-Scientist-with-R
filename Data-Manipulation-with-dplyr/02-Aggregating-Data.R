# --------------------------------------------------- 
# Data Manipulation with dplyr - Aggregating Data
# 20 set 2020 
# VNTBJR 
# --------------------------------------------------- 
#
# Load packages
library(dplyr)

# Load data
counties <- readRDS(file = "Datasets/counties.rds")

# The count verb  -------------------------------------------
# Counting by region
counties_selected <- counties %>% 
  select(region, state, population, citizens)

# Use count to find the number of counties in each region
counties_selected %>%
  count(region, sort = TRUE)

# Find number of counties per state, weighted by citizens
counties_selected %>%
  count(state, wt = citizens, sort = TRUE)

# Mutating and counting
counties_selected <- counties %>% 
  select(region, state, population, walk)

counties_selected %>%
  # Add population_walk containing the total number of people who walk 
  # to work 
  mutate(population_walk = walk * population / 100) %>% 
  # Count weighted by the new column
  count(state, wt = population_walk, sort = TRUE)
   
######################################################################
# The group_by, summarize and ungroup verbs  -------------------------------------------
# Summarizing
counties_selected <- counties %>% 
  select(county, population, income, unemployment)

# Summarize to find minimum population, maximum unemployment, and average income
counties_selected %>%
  summarize(min_poputlation = min(population), 
            max_unemployment = max(unemployment),
            average_income = mean(income))
  
# Summarizing by state
counties_selected <- counties %>% 
  select(state, county, population, land_area)

# Group by state and find the total area and population
counties_selected %>%
  group_by(state) %>% 
  summarize(total_area = sum(land_area), total_population = sum(population))
  
# Add a density column, then sort in descending order
counties_selected %>%
  group_by(state) %>%
  summarize(total_area = sum(land_area),
            total_population = sum(population), 
            density = total_population / total_area) %>%
  arrange(desc(density))
  
# Summarize by state and region
counties_selected <- counties %>% 
  select(region, state, county, population)

# Summarize to find the total population
counties_selected %>%
  group_by(region, state) %>% 
  summarize(total_pop = sum(population))

# Calculate the average_pop and median_pop columns 
counties_selected %>%
  group_by(region, state) %>%
  summarize(total_pop = sum(population)) %>%
  
# Calculate the average_pop and median_pop columns 
counties_selected %>%
  group_by(region, state) %>%
  summarize(total_pop = sum(population)) %>%  
  summarise(average_pop = mean(total_pop), 
            median_pop = median(total_pop))
 
######################################################################
# The top_n verb  -------------------------------------------
# Selecting a coutny from each region
counties_selected <- counties %>%
  select(region, state, county, metro, population, walk)

# Group by region and find the greatest number of citizens who walk to work
counties_selected %>%
  group_by(region) %>% 
  top_n(1, walk)

# Finding the highest-income state in each region
counties_selected <- counties %>%
  select(region, state, county, population, income)

counties_selected %>%
  group_by(region, state) %>%
  # Calculate average income
  summarize(average_income = mean(income)) %>% 
  # Find the highest income state in each region
  top_n(1, average_income)

# Using summarize, top_n, and count together
counties_selected <- counties %>%
  select(state, metro, population)

# Find the total population for each combination of state and metro
counties_selected %>%
  group_by(state, metro) %>% 
  summarize(total_pop = sum(population))

# Extract the most populated row for each state
counties_selected %>%
  group_by(state, metro) %>%
  summarize(total_pop = sum(population)) %>% 
  top_n(1, total_pop)

# Count the states with more people in Metro or Nonmetro areas
counties_selected %>%
  group_by(state, metro) %>%
  summarize(total_pop = sum(population)) %>%
  top_n(1, total_pop) %>% 
  ungroup() %>% 
  count(metro, sort = TRUE)
 
######################################################################

