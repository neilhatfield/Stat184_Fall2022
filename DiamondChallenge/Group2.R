library(tidyverse)
library(ggplot2)
library(dplyr)

data("diamonds")


diamonds %>%  # for dimensions x
  group_by(cut) %>%
  summarise(Mean = mean(x),
            SD=sd(x),
            sum=sum(x),
            mad=mad(x),
            min = min(x, na.rm = TRUE),
            Q1 = quantile(x, probs = 0.25, na.rm = TRUE),
            median = median(x, na.rm = TRUE),
            Q3 = quantile(x, probs = 0.75, na.rm = TRUE),
            max = max(x, na.rm = TRUE)
            )

diamonds %>% # for dimensions y
  group_by(cut) %>%
  summarise(Mean = mean(y),
            SD=sd(y),
            sum=sum(y),
            mad=mad(y),
            min = min(y, na.rm = TRUE),
            Q1 = quantile(y, probs = 0.25, na.rm = TRUE),
            median = median(y, na.rm = TRUE),
            Q3 = quantile(y, probs = 0.75, na.rm = TRUE),
            max = max(y, na.rm = TRUE)
            )

diamonds %>% # for dimensions z
  group_by(cut) %>%
  summarise(Mean = mean(z),
            SD=sd(z),
            sum=sum(z),
            mad=mad(z),
            min = min(z, na.rm = TRUE),
            Q1 = quantile(z, probs = 0.25, na.rm = TRUE),
            median = median(z, na.rm = TRUE),
            Q3 = quantile(z, probs = 0.75, na.rm = TRUE),
            max = max(z, na.rm = TRUE)
  )