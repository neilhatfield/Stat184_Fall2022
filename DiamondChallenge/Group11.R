data(diamonds)
library(dplyr)


diamonds %>%
  group_by(cut) %>%
  summarize(
    Meanx = mean(x, na.rm=TRUE),
    Meany = mean(y, na.rm=TRUE),
    Meanz = mean(z, na.rm=TRUE),
    sdx = sd(x),
    sdy = sd(y),
    sdz = sd(z),
    madx = mad(x),
    mady = mad(y),
    madz = mad(z),
    minx = min(x, na.rm=TRUE),
    miny = min(y, na.rm=TRUE),
    minz = min(z, na.rm=TRUE),
    maxx = max(x, na.rm=TRUE),
    maxy = max(y, na.rm=TRUE),
    maxz = max(z, na.rm=TRUE),
    medianx = median(x, na.rm=TRUE),
    mediany = median(y, na.rm=TRUE),
    medianz = median(z, na.rm=TRUE),
    q1x = quantile(x, probs = 0.25, na.rm=TRUE),
    q1y = quantile(y, probs = 0.25, na.rm=TRUE),
    q1z = quantile(z, probs = 0.25, na.rm=TRUE),
    q3x = quantile(x, probs = 0.75, na.rm=TRUE),
    q3y = quantile(y, probs = 0.75, na.rm=TRUE),
    q3z = quantile(z, probs = 0.75, na.rm=TRUE),
  )
