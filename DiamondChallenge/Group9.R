library(ggplot2)
data(diamonds)

diamonds %>%
  group_by(cut) %>%
  summarize(count = n(), x_min = min(x, na.rm = TRUE), x_Q1 = quantile(x, 0.25, na.rm = TRUE), x_median = median(x, na.rm = TRUE), 
            x_Q3 = quantile(x, 0.75, na.rm = TRUE), x_max = max(x, na.rm = TRUE), x_mad = mad(x, na.rm = TRUE), 
            x_mean = mean(x, na.rm = TRUE), x_sd = sd(x, na.rm = TRUE),
            y_min = min(y, na.rm = TRUE), y_Q1 = quantile(y, 0.25, na.rm = TRUE), y_median = median(y, na.rm = TRUE), 
            y_Q3 = quantile(y, 0.75, na.rm = TRUE), y_max = max(y, na.rm = TRUE), y_mad = mad(y, na.rm = TRUE), 
            y_mean = mean(y, na.rm = TRUE), y_sd = sd(y, na.rm = TRUE),
            z_min = min(z, na.rm = TRUE), z_Q1 = quantile(z, 0.25, na.rm = TRUE), z_median = median(z, na.rm = TRUE), 
            z_Q3 = quantile(z, 0.75, na.rm = TRUE), z_max = max(z, na.rm = TRUE), z_mad = mad(z, na.rm = TRUE), 
            z_mean = mean(z, na.rm = TRUE), z_sd = sd(z, na.rm = TRUE))
            
