#       _/_/    _/  _/      _/_/      _/   
#    _/    _/  _/  _/    _/    _/  _/_/    
#       _/    _/_/_/_/    _/_/_/    _/     
#    _/          _/          _/    _/      
# _/_/_/_/      _/    _/_/_/    _/_/_/     

# Exploratory Data Analysis of Gestation data
install.packages("tidyverse")
install.packages("mosaicData")
library(tidyverse)
library(mosaicData)
# if you don't have mosaicData, install it

data(Gestation)

# Activity 1 - Quick look at the data

# number of observations
count(Gestation)
view(Gestation)

# number of observations per racial group
count(Gestation, race)

# number of observations by racial group and level of mother's education
Gestation_n_race_ed <- count(Gestation, )
?count()

Gestation_race_ded <- Gestation %>% select(race, ded) %>% 
  group_by(race, ded) %>% count() %>% order_by(race)

?order_by()
?arrange()

View(Gestation_race_ded)

# Activity 2 - Further summary statistics

# mean age of mothers across all births
summarise(Gestation, Mean_age = mean(age, na.rm= TRUE),
          Mean_wt = mean(wt)) 
?mean()
# ensure you use a human friendly name for the value you're creating

# calculate both mothers' mean age and babies' mean weight
summarise(Gestation, 
          `Mean age` = ...,
          `Mean wt`  = ...)

# useful for cleaning names, from package janitor  janitor::clean_names()

# Activity 3 - Grouped summaries

# make a new data frame containing only id, age and race variables

i_a_r <- Gestation %>% select(id, age, race)
head(i_a_r)


# calculate the mean age by race

i_a_r %>% group_by(race) %>% summarise(Mean_Age = mean(age, na.rm= TRUE), sd_age = sd(age))

# Activity 4 - Extensions


# Activity 4a - Correlation

# Calculate the correlation between age and weight across all births

# Calculate the correlation between age and weight for each race group


# Activity 4b - Multiple summary statistics

# Calculate the sample mean of the ages and weights of the mothers in each race group


# Activity 4c - Pivoting wider

# Make a wide table from the summary data frame calculated in Activity 1 that has the number of observations for each combination of mother's education level and race. Make each row is an education level and each column a race group.

# Hint: Look at the help file for `pivot_wider` for what to do with missing cells (where there is no combination of these variables) and set the argument to be 0.


# Activity 4d - Multiple summary statistics

# Calculate the mean, standard deviation, minimum, maximum and proportion of values missing for the mothers' ages for each race group.
# Hint: you *can* use summarise_at() for this but you could also just summarise()