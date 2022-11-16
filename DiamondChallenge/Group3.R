library(ggplot2)
data(diamonds)
statsDiamonds <- diamonds %>%
  group_by(cut) %>%
  summarise(
    min_x = min(x, na.rm = TRUE),
    min_y = min(y, na.rm = TRUE),
    min_z = min(z, na.rm = TRUE),
    Q1_x = quantile(x, probs = 0.25, na.rm = TRUE),
    Q1_y = quantile(y, probs = 0.25, na.rm = TRUE),
    Q1_z = quantile(z, probs = 0.25, na.rm = TRUE),
    median_x = median(x, na.rm = TRUE),
    median_y = median(y, na.rm = TRUE),
    median_z = median(z, na.rm = TRUE),
    Q3_x = quantile(x, probs = 0.75, na.rm = TRUE),
    Q3_y = quantile(y, probs = 0.75, na.rm = TRUE),
    Q3_z = quantile(z, probs = 0.75, na.rm = TRUE),
    max_x = max(x, na.rm = TRUE),
    max_y = max(y, na.rm = TRUE),
    max_z = max(z, na.rm = TRUE),
    mad_x = mad(x, na.rm = TRUE),
    mad_y = mad(y, na.rm = TRUE),
    mad_z = mad(z, na.rm = TRUE),
    mean_x = mean(x, na.rm = TRUE),
    mean_y = mean(y, na.rm = TRUE),
    mean_z = mean(z, na.rm = TRUE),
    standard_deviation_x = sd(x, na.rm = TRUE),
    standard_deviation_y = sd(y, na.rm = TRUE),
    standard_deviation_z = sd(diamonds$z, na.rm = TRUE)
  )
View(statsDiamonds)