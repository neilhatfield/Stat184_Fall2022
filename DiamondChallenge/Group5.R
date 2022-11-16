library(dplyr)
library(ggplot2)
data(diamonds)

# Updated diamonds data frame - x,y,z relative to cut
# Calculates the count, min, Q1, median, Q3, max, mad, mean, and sd for each dimension x,y,z relative to cut
updated_diamonds <- diamonds %>%
  group_by(cut) %>%
  select(x,y,z) %>%
  summarise(across(c(x,y,z), list(
  count = ~n(),
  min = min,
  Q1 = ~quantile(., 0.25),
  median = median,
  Q3 = ~quantile(., 0.75),
  max = max,
  mad = mad,
  mean = mean,
  sd = sd
)))

