
diamonds%>%
  group_by(carat)%>%
  summarise(
    xCount = n(),
    xMin = min(x),
    xQ1 = quantile(x, probs = 0.25),
    xMedian = median(x),
    xQ3 = quantile(x, probs = 0.75),
    xMax = max(x),
    xMAD = mad(x),
    xMean = mean(x),
    xSD = sd(x),
    yMin = min(y),
    yQ1 = quantile(y, probs = 0.25),
    yMedian = median(y),
    yQ3 = quantile(y, probs = 0.75),
    yMax = max(y),
    yMAD = mad(y),
    yMean = mean(y),
    ySD = sd(y),
    zMin = min(z),
    zQ1 = quantile(z, probs = 0.25),
    zMedian = median(z),
    zQ3 = quantile(z, probs = 0.75),
    zMax = max(z),
    zMAD = mad(z),
    zMean = mean(z),
    zSD = sd(z)
  )

