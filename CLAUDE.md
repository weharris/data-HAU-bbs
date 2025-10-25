# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains data and analysis scripts for the Harper Adams University Breeding Bird Survey (HAU BBS). The project is part of the agridat-data-services ecosystem and focuses on biodiversity monitoring inspired by the British Trust for Ornithology Breeding Bird Survey (BTO BBS).

## Data Architecture

### Data Files Location and Purpose

The data directory structure follows a raw-to-tidy workflow:

- `data/raw/birddata.csv` - Original HAU BBS observations from the HAU ES Wildlife SharePoint
- `data/birddata_tidy.xlsx` - Tidied version of birddata.csv (primary analysis dataset)
- `data/Master_species_observation_list.xlsx` - Consolidated HAU Biodiversity file from the shiny_biodiversity_dash project
- `data/context/` - Reference data for species validation:
  - `BOU_British_List_10th-and-57th_IOC14_2_v2.xlsx` - Original British Ornithological Union British List
  - `BOU_British_List_tidy.xlsx` - Tidied version for species name validation

### Key Data Fields

The primary dataset (`birddata_tidy.xlsx`) contains:
- `bird_spp` - Bird species common name
- `year` - Survey year (2022-2024)
- `transect` - Survey transect identifier
- `occasion` - Survey occasion/visit number

## Development Environment

### R Project Configuration

This is an RStudio project with:
- 2 spaces for indentation (not tabs)
- UTF-8 encoding
- Standard R project settings

### Required R Packages

The analysis requires these R packages (from `scripts/EDA.R`):
```r
library(readxl)      # For reading Excel files
library(tidyverse)   # Data manipulation and visualization
library(gt)          # Table formatting
library(ggplot2)     # Plotting (also loaded via tidyverse)
```

## Running Analysis

### Exploratory Data Analysis

The main analysis script is `scripts/EDA.R`. To run it:

1. Open the RStudio project: `data-HAU-bbs.Rproj`
2. Open `scripts/EDA.R`
3. Run the entire script or sections as needed

The script is organized with numbered sections:
- Section 1: Setup and data loading
- Section 2: Analysis (species counts, temporal trends, transect summaries)

### Key Analysis Outputs

The EDA script produces:
- Unique species counts by year (2022-2024)
- Total observation counts
- Transect walk frequency
- Barplot of species observations (horizontal, sorted by frequency)
- ggplot2 bar chart of species counts with minimal theme

## Data Integration Notes

There is commented-out code in `scripts/EDA.R` that shows integration with the `Master_species_observation_list.xlsx` file. This demonstrates how to filter for BBS_RSBP survey events and Bird taxon groups from the consolidated biodiversity dataset.

## External Data Sources

- HAU BBS raw data: [HAU ES Wildlife SharePoint](https://outlook.office365.com/groups/live.harper.ac.uk/HAUBiodiversityData/files)
- BOU British List: [British Ornithological Union British List](https://bou.org.uk/british-list/)
- Related project: [HAU Biodiversity Shiny Dashboard](https://github.com/HAU-Biodiversity/shiny_biodiversity_dash)
