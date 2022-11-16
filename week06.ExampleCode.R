# Galton Height Data Set ----
# How does the ordered structure of the height data vary by the family
# role of the person?

## Plan ----
### Data Set--tidied: https://www.dropbox.com/s/tsadrglnhhv55an/galtonData.csv?dl=1
### Load packages (ggplot2, esquisse )
### Aim: rank of heights by family role
### Geometry: box plot
### Mappings: family role, heights

## Code ----
### Load Packages
library(ggplot2)
library(esquisse)

### Read in the data ----
galtonData <- read.table(
  file = "https://www.dropbox.com/s/tsadrglnhhv55an/galtonData.csv?dl=1",
  header = TRUE,
  sep = ","
)
# You may use the above URL to import my Galton Data to compare my tided version
# with your own tided version.

### Check and Clean ----
View(galtonData)

#### Add a height column to supplement the adjusted heights ----
galtonData$height <- galtonData$adjustedHeight + 60

### Using esquisse for interactive start ----
esquisse::esquisser(data = galtonData, viewer = "browser")
#### Don't forget to click the STOP sign icon in the Console after you're
#### done using esquisser

### Initial Code from Esquisse ----
ggplot(galtonData) +
  aes(x = role, y = height) +
  geom_boxplot(fill = "#112446") +
  theme_minimal()

## Improve ---
### The default fill makes seeing the midline impossible
### The labels could use improvement and units of measure
### Perhaps a different theme might be useful
### The code could be better organized and commented

### Improved Code ----
# Create the framework and map family hole to horizontal, height to vertical
ggplot(
  data = galtonData,
  mapping = aes(x = role, y = height)
) +
  geom_boxplot() + # Make a box plot to show the ordered structure, no fill
  theme_bw() + # try the black and white theme
  ylab("Height (in)") + # improve axis label
  xlab("Family role")

## Polish ----
### The font size is a bit small
### A fill color would help make the visualization pop
### Add a title
ggplot(
  data = galtonData,
  mapping = aes(x = role, y = height)
) +
  geom_boxplot(fill = "cadetblue1") + # Add color
  theme_bw() +
  ylab("Height (in)") +
  xlab("Family role") +
  theme(
    text = element_text(size = 12) # Change the base font size
  ) +
  ggtitle("Side-by-side Box Plots of Heights by Family Role") # Add title

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

### Remaining sections are left to student groups
### Hint: consider the idea of facets (small multiples)

## Improve ----

## Polish ----
