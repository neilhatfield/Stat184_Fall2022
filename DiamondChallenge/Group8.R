diamonds %>%
  group_by(cut) %>%
  summarize(
    x_count = n_distinct(x, na.rm = TRUE),
    x_min = min(x, na.rm = TRUE),
    x_Q1 = quantile(x, probs = 0.25, na.rm = TRUE),
    x_median = median(x, na.rm = TRUE),
    x_Q3 = quantile(x, probs = 0.75, na.rm = TRUE),
    x_max = max(x, na.rm = TRUE),
    x_mad = mad(x, center = median(x), constant = 1.4826, na.rm = TRUE),
    x_mean = mean(x, na.rm = TRUE),
    x_sd = sd(x, na.rm = TRUE),
    
    y_count = n_distinct(y, na.rm = TRUE),
    y_min = min(y, na.rm = TRUE),
    y_Q1 = quantile(y, probs = 0.25, na.rm = TRUE),
    y_median = median(y, na.rm = TRUE),
    y_Q3 = quantile(y, probs = 0.75, na.rm = TRUE),
    y_max = max(y, na.rm = TRUE),
    y_mad = mad(y, center = median(y), constant = 1.4826, na.rm = TRUE),
    y_mean = mean(y, na.rm = TRUE),
    y_sd = sd(y, na.rm = TRUE),
    
    z_count = n_distinct(z, na.rm = TRUE),
    z_min = min(z, na.rm = TRUE),
    z_Q1 = quantile(z, probs = 0.25, na.rm = TRUE),
    z_median = median(z),
    z_Q3 = quantile(z, probs = 0.75, na.rm = TRUE),
    z_max = max(z, na.rm = TRUE),
    z_mad = mad(z, center = median(z), constant = 1.4826, na.rm = TRUE),
    z_mean = mean(z, na.rm = TRUE),
    z_sd = sd(z, na.rm = TRUE),
  )