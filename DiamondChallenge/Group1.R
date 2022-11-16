# Necessary library and data set.
library(tidyverse)
data(diamonds)


# Display statistics of x, y, and z attribute for each cut
diamonds %>%
  group_by(cut) %>%
  summarize(
    Count_x = length(x),
    Min_x = min(x, na.rm = TRUE),
    Q1_x = quantile(x, probs = 0.25, na.rm = TRUE),
    Med_x = median(x, na.rm = TRUE),
    Q3_x = quantile(x, probs = 0.75, na.rm = TRUE),
    Max_x = max(x, na.rm = TRUE),
    Mad_x = mad(x, na.rm = TRUE),
    Mean_x = mean(x, na.rm = TRUE),
    Sd_x = sd(x, na.rm = TRUE),
    Count_y = length(y),
    Min_y = min(y, na.rm = TRUE),
    Q1_y = quantile(y, probs = 0.25, na.rm = TRUE),
    Med_y = median(y, na.rm = TRUE),
    Q3_y = quantile(y, probs = 0.75, na.rm = TRUE),
    Max_y = max(y, na.rm = TRUE),
    Mad_y = mad(y, na.rm = TRUE),
    Mean_y = mean(y, na.rm = TRUE),
    Sd_y = sd(y, na.rm = TRUE),
    Count_z = length(z),
    Min_z = min(z, na.rm = TRUE),
    Q1_z = quantile(z, probs = 0.25, na.rm = TRUE),
    Med_z = median(z, na.rm = TRUE),
    Q3_z = quantile(z, probs = 0.75, na.rm = TRUE),
    Max_z = max(z, na.rm = TRUE),
    Mad_z = mad(z, na.rm = TRUE),
    Mean_z = mean(z, na.rm = TRUE),
    Sd_z = sd(z, na.rm = TRUE)
  )