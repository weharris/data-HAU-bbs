# Header ####
# who: Ed H
# what: EDA for HAU BBS data
# when:2025-10-25

# Contents ####
# 1 Setup and data
# 2 Analysis

# 1 Setup and data ####
library(readxl)

mydat <- read_xlsx("data/birddata_tidy.xlsx")

# 2 Analysis ####
table(mydat$bird_spp)
length(table(mydat$bird_spp))
