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
avg.arrival.delay <- flights %>%
  group_by(dest) %>%
  summarise(avg.delay = mean(arr_delay, na.rm = TRUE)) %>%
  mutate(faa = dest) %>%
  left_join(airports, by = 'faa') %>%
  arrange(-avg.delay)
avg.arrival.delay

# Create a dataframe of the average arrival delay for each airline, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average delay?
avg.airline.delay <- flights %>%
  group_by(carrier) %>%
  summarise(avg.delay = mean(arr_delay, na.rm=TRUE)) %>%
  left_join(airlines, by='carrier') %>%
  arrange(avg.delay)
avg.airline.delay

### Bonus

# Calculate the average delay by city AND airline, then merge on the city and airline information
# Which city & airport had the greatest average delay?
avg.city.airline <- flights %>%
  group_by(dest, carrier) %>%
  summarise(avg.delay = mean(arr_delay, na.rm=TRUE)) %>%
  left_join(airlines, by='carrier') %>%
  mutate(faa = dest) %>%
  left_join(airports, by = 'faa') %>%
  left_join(airlines, by='carrier') %>%
  arrange(-avg.delay)
avg.city.airline
