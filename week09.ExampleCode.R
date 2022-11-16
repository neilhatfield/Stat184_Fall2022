# Load packages being used ----
library(janitor)
library(dplyr)
library(knitr)
library(kableExtra)

# Load the data ----
## The following lets you load a data frame from a package without loading
## the whole package
data("diamonds", package = "ggplot2")


# Frequency Tables ----
## Plan the table ----
### We want to make a two-way frequency table with absolute &
### relative frequencies with color making rows and cut making columns.
### We also want to see the margins and add titles

## Code the frequency table ----
diamondTable <- diamonds %>%
  tabyl(color, cut) %>% # Creates the tabyl object
  adorn_totals(where = c("row", "col") ) %>% # Adds the margins
  adorn_percentages(denominator = "all") %>% # Uses the grand total to get rel. freq
  adorn_pct_formatting(digits = 2) %>% # rounds percentages
  adorn_title(placement = "combined", row_name = "Color", col_name = "Cut") # titles

## Improve the frequency table ----
### Add the numbers, with commas; make the percents inside the parentheses

### Sets the formatting of numbers ----
formatNs <- attr(diamondTable, "core") %>%
  adorn_totals(where = c("row", "col")) %>% # Extracts the counts
  mutate(
    across(where(is.numeric), format, big.mark = ",") # Formats (base R)
  )

### Adds the absolute frequencies to our table ----
diamondFreqTab <- diamondTable %>%
  adorn_ns(position = "front", ns = formatNs)
# Position dictates which number comes first

## Polishing the frequency table ----
### Add a caption, add lines, bold headers, add row stripes, set text alignment
diamondFreqTab %>%
  kable(
    caption = "Cut and Color of Diamonds",
    booktabs = TRUE,
    align = c("l", rep("c", 6))
  ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "condensed"),
    font_size = 16
  )

# Summary Tables ----
## Create and explore the model output object
# data("diamonds", package = "ggplot2")
diamondModel <- lm(formula = price ~ carat, data = diamonds)
diamondModOut <- summary(diamondModel)

## Create a summary table ----
### Table for regression coefficients
diamondModOut$coefficients %>%
  kable() %>%
  kableExtra::kable_classic()
  kable(
    digits = 2,
    format.args = list(big.mark = ","),
    caption = "Linear Regression Coefficients",
    booktabs = TRUE,
    align = "lcccc"
  ) %>%
  kableExtra::kable_classic(font_size = 14)
