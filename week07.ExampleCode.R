# Army Marital Status Data Set ----
## How do the frequencies vary as we look at the pay grade,
## marital status, and sex of members of the US Army?

## Plan ----
### Data set-tided: "https://www.dropbox.com/s/a459o1dkuag9lzz/army_maritalStatus.csv?dl=1"
### (Clean the data)
### Packages (ggplot2, possibly esquisse)
### Aim: look at the frequency by the other three attributes
### Geometry: bar chart
### Mappings: vertical (y)-frequency, need to play with the others

## Code ----
### Note you only need the library calls once per session
library(ggplot2)
library(esquisse)

### Read in data ----
armyData <- read.table(
  file = "https://www.dropbox.com/s/a459o1dkuag9lzz/army_maritalStatus.csv?dl=1",
  header = TRUE,
  sep = ","
)

### Check and Clean ----
str(armyData) # shows me the structure of the data frame
### The output of the str call tells me that my frequency column was read in
### as character data rather than numeric

library(readr) # part of tidyverse
# parse_number will properly convert (chr) "9,456" into the (num) 9456
armyData$Frequency <- parse_number(armyData$Frequency)

### Use esquisse ----
esquisse::esquisser(data = armyData, viewer = "browser")

#### Initial Plot
ggplot(armyData) +
  aes(x = Pay.Grade, weight = Frequency) +
  geom_bar(fill = "#112446") +
  theme_bw() +
  facet_grid(vars(Sex), vars(Marital.Status))

## Improve ----
### Plan ----
### The way that esquisse write code isn't necessarily the best format
### Change the color to default
### Fix labels and add title
### We will want to wrangle so let's make a bit of starting code

### Improved ggplot code ----
ggplot(
  data = armyData,
  mapping = aes(x = Pay.Grade, weight = Frequency)
) +
  geom_bar() +
  theme_bw() +
  facet_grid(rows = vars(Sex), cols = vars(Marital.Status)) +
  xlab("Pay Grade") +
  ggtitle("Distribution of US Army Members by Pay Grade, Marital Status, and Sex")

### Data Wrangling ----
#### Make a list of classifications----
payGroups <- list(
  enlisted = c("E-1", "E-2", "E-3", "E-4", "E-5", "E-6", "E-7", "E-8", "E-9"),
  officers = c("O-1", "O-2", "O-3", "O-4", "O-5", "O-6", "O-7", "O-8", "O-9", "O-10"),
  warrant = c("W-1", "W-2", "W-3", "W-4", "W-5")
)

#### Set up filtering ----
library(dplyr)
#### writing code to reuse, not run now
# armyData %>%
#   filter(Pay.Grade %in% payGroups$enlisted)

# armyData %>%
#   filter(Pay.Grade %in% payGroups$officers)

# armyData %>%
#   filter(Pay.Grade %in% payGroups$warrant)

## Polish ----
### Bring together our improved ggplot code and our filter commands
armyData %>%
  filter(Pay.Grade %in% payGroups$enlisted) %>%
  ggplot(
    mapping = aes(x = Pay.Grade, weight = Frequency)
  ) +
  geom_bar() +
  theme_bw() +
  facet_grid(rows = vars(Sex), cols = vars(Marital.Status)) +
  xlab("Pay Grade") +
  ggtitle("US Army Enlisted Members by Pay Grade, Marital Status, and Sex")

armyData %>%
  filter(Pay.Grade %in% payGroups$officers) %>%
  ggplot(
    mapping = aes(x = Pay.Grade, weight = Frequency)
  ) +
  geom_bar() +
  theme_bw() +
  facet_grid(rows = vars(Sex), cols = vars(Marital.Status)) +
  xlab("Pay Grade") +
  ggtitle("US Army Officers by Pay Grade, Marital Status, and Sex")

armyData %>%
  filter(Pay.Grade %in% payGroups$warrant) %>%
  ggplot(
    mapping = aes(x = Pay.Grade, weight = Frequency)
  ) +
  geom_bar() +
  theme_bw() +
  facet_grid(rows = vars(Sex), cols = vars(Marital.Status)) +
  xlab("Pay Grade") +
  ggtitle("US Army Warrant Officers by Pay Grade, Marital Status, and Sex")
