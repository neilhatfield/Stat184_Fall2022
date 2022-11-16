# Week 12 Example Code ----
library(rvest)
library(dplyr)
library(readr)
library(ggplot2)
library(tidyr)

## Web Scraping ----

### ESPN Data ----
espnPSUTables <- read_html(
  x = "https://www.espn.com/college-football/team/stats/_/id/213/penn-state-nittany-lions"
) %>%
  html_elements(css = "table") %>%
  html_table()

#### After looking at the list elements, we want elements 3 & 4.

### PSU Roster Data ----
psuFBRoster <- read_html(
  x = "https://gopsusports.com/sports/football/roster"
) %>%
  html_elements(css = "table") %>%
  html_table()

#### After looking at the list elements, we want element 3.

## Data Wrangling ----

### Column bind ESPN elements ----
espnRushing <- bind_cols(espnPSUTables[[3]], espnPSUTables[[4]])

### Clean ESPN Data ----
#### Remove Total Row, Separate Name from Position,
#### Make a new full name column, converts yards into numeric
espnRushing <- espnRushing %>%
  filter(Name != "Total") %>%
  tidyr::separate(
    col = Name,
    into = c("First", "Last", "Position")
  ) %>%
  mutate(
    "Player" = paste(First, Last, sep = " "),
    .before = First
  ) %>%
  mutate(
    YDS = parse_number(YDS)
  )

### Clean PSU Data ----
#### Extract the item for convenience
roster <- psuFBRoster[[3]]

#### Compress extra spaces in the name column
roster <- roster %>%
  mutate(
    `Full Name` = stringr::str_squish(`Full Name`)
  )

### Join ESPN and PSU Data Frames ----
#### Keep those players who are in both frames
psuRushing <- inner_join(
  x = espnRushing,
  y = roster,
  by = c("Player" = "Full Name", "Position" = "Pos.")
)


## Make Plot ----
ggplot(
  data = psuRushing,
  mapping = aes(x = `Wt.`, y = YDS, shape = Position, color = Position)
) +
  geom_point(size = 4, na.rm = TRUE) +
  geom_text(
    mapping = aes(label = paste0("#",`#`)),
    color = "black",
    nudge_y = 30,
    size = 4,
    na.rm = TRUE
  ) +
  theme_bw() +
  xlab("Player weight (lbs)") +
  ylab("Total rushing yards") +
  ggtitle("Total Rushing Yards by PSU Player Weight and Position") +
  theme(
    text = element_text(size = 12)
  )


