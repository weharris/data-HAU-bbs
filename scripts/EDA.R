# Header ####
# who: Ed H
# what: EDA for HAU BBS data
# when:2025-10-25

# Contents ####
# 1 Setup and data
# 2 Analysis

# 1 Setup and data ####
library(readxl)
library(tidyverse)
library(gt)
library(ggplot2)

mydat <- read_xlsx("data/birddata_tidy.xlsx")

# megdat <- read_xlsx("data/Master_species_observation_list.xlsx")
# megbird <- megdat[megdat$survey_event == "BBS_RSBP" && megdat$taxon_group == "Bird",]  
# table(megbird$survey_notes)
# table(mydat$occasion)

# 2 Analysis ####

# Unique common names
sort(unique(mydat$bird_spp))

# how many observations total?
nrow(mydat)

# How many observations per year?
for(i in 2022:2024){
  print(c(i, length(mydat$year[mydat$year == i])))
} 

# How many unique species in total?
length(table(mydat$bird_spp))

# How many species per year?
for(i in 2022:2024) {
  print(length(table(mydat$bird_spp[mydat$year==i])))
}

# How many transects are there?
length(unique(sort(mydat$transect)))

# How many transect "walks" have there been?
length(table(mydat$year, mydat$transect, mydat$occasion))

# How many transect "walks" have there been?
for(i in 2022:2024){
  print(length(table(mydat$transect[mydat$year==i], mydat$occasion[mydat$year==i])))
}

par(mar = c(5, 10, 4, 2) + 0.1)
barplot(sort(table(mydat$bird_spp)),
        horiz=T,
        las = 2,
        cex.names = .5)
par(mar(c(5, 4, 4, 2) + 0.1))

mydat |>
  count(bird_spp) |>
  mutate(bird_spp = fct_reorder(bird_spp, n)) |> 
  ggplot(aes(x = n, y = bird_spp)) +
  geom_col(fill = "darkblue") +  
  labs(
    x = 'Counts',
    y = element_blank(),
    title = 'HAU Breeding Birds Survey 2022-2023'
  ) +
  theme_minimal(base_size = 8) 

