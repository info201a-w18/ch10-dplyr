# Exercise 6: dplyr join operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library(nycflights13)
library(dplyr)

# Create a dataframe of the average arrival delay for each destination, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average delay?


# Create a dataframe of the average arrival delay for each airline, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average delay?


### Bonus

# Calculate the average delay by city AND airline, then merge on the city and airline information
# Which city & airport had the greatest average delay?

