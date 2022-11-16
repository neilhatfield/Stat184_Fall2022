# Loading packages ----
library(ggplot2) # For the diamonds data set
library(dplyr)

# Measuring a Collection's Size ----
## Three ways to impliment the Count statistic
## to measure the size of a data collection
diamonds %>%
  select(carat) %>%
  summarize(size = n())

nrow(diamonds)

length(diamonds$carat)


# Five Number Summary ----
## Individual Calls ----
min(diamonds$carat, na.rm = TRUE)
quantile(diamonds$carat, probs = 0.25, na.rm = TRUE)
median(diamonds$carat, na.rm = TRUE)
quantile(diamonds$carat, probs = 0.75, na.rm = TRUE)
max(diamonds$carat, na.rm = TRUE)

## Single Quantile Call
quantile(diamonds$carat, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

## Using Dplyr ----
diamonds %>%
  summarize(
    min = min(carat, na.rm = TRUE),
    Q1 = quantile(carat, probs = 0.25, na.rm = TRUE),
    median = median(carat, na.rm = TRUE),
    Q3 = quantile(carat, probs = 0.75, na.rm = TRUE),
    max = max(carat, na.rm = TRUE)
  )

## Using summary
summary(diamonds$carat)

# Advanced Data Wrangling Challenge ----
## Plan and code to provide descriptive and incisive information
## about the physical dimensions of diamonds relative the cut

## Plan ----
### Group the data by cut
### We need to focus on physical dimensions (x, y, z, depth, and table)
### We need to select appropriate statistics
#### five-number summary, MAD, SAM, SASD, and count

## Code using dplyr ----
dimensionStats <- diamonds %>%
  group_by(cut) %>%
  select(cut, x, y, z) %>%
  summarize(
    across(
      .cols = where(is.numeric),
      .fns = list(
        min = ~min(.x, na.rm = TRUE),
        Q1 = ~quantile(.x, probs = 0.25, na.rm = TRUE),
        median = ~median(.x, na.rm = TRUE),
        Q3 = ~quantile(.x, probs = 0.75, na.rm = TRUE),
        max = ~max(.x, na.rm = TRUE),
        mad = ~mad(.x, na.rm = TRUE),
        sam = ~mean(.x, na.rm = TRUE),
        sasd = ~sd(.x, na.rm = TRUE)
      )
    ),
    count = n()
  )

## Code using psych ----
library(psych)
dimensionStats2 <- describeBy(
  x + y + z ~ cut,
  data = diamonds,
  mat = TRUE,
  quant = c(0.25, 0.75)
) %>%
  mutate(
    vars = case_when(
      vars == 1 ~ "length (mm; x)",
      vars == 2 ~ "width (mm; y)",
      vars == 3 ~ "depth (mm; z)"
    )
  ) %>%
  select(cut = group1, dimension = vars, count = n,
         min, Q1 = Q0.25, median, Q3 = Q0.75, max, mad, mean, sd)

