# PECES Workshop

Author: rroday  
Date: 2025-12-19

## Overview

This repository contains materials for a workshop on using open-access fisheries and environmental datasets in Earth and ocean science classrooms. The lesson emphasis is "coding to learn" — using R to derive ecological and management insights from real-world datasets (assumes basic R knowledge).

Key goals:
- Teach data access, cleaning, visualization, and interpretation using open fisheries and environmental datasets.
- Demonstrate how real-world datasets can connect classroom coding exercises to fisheries management and sustainability topics.
- Provide a short example lesson and resources instructors can adapt.

Target audience & prerequisites:
- Introductory-to-intermediate R users (basic familiarity with R and RStudio).
- Undergraduate or graduate students in Earth, ocean, or environmental science; instructors interested in data-driven teaching examples.

## Datasets & data sources (examples)

Primary fisheries datasets:
- MRIP (Marine Recreational Information Program) — recreational catch data (downloadable CSVs).
- DisMAP (distribution mapping; R code available but may need maintenance) — https://apps-st.fisheries.noaa.gov/dismap/DisMAP.html
- FIS (Fisheries Information System) — economic and management data (downloadable CSVs).

Other NOAA surveys and data portals:
- NOAA fisheries dataset examples (many catalogs) — e.g. Northern Shrimp Survey Data: https://www.fisheries.noaa.gov/resource/data/northern-shrimp-survey-data
- Surveyjoin package (useful for joining survey data; investigate availability).

Environmental / supplemental data:
- ERDDAP (oceanographic & environmental time-series; CSV downloads).
- USGS stream data via the dataRetrieval R package.

Notes: Many datasets include metadata and error/uncertainty estimates that can (and should) be used when teaching interpretation and management implications.

## Session proposal 
I propose a session that covers how open-access fisheries datasets (NOAA MRIP, DisMAP, FOSS) can be used to teach coding, visualization, and applied analysis in Earth and ocean science classrooms. These datasets are spatially and temporally rich, relevant to students interested in marine resource management and climate impacts.

Suggested format:
- 20-minute walkthrough: a compact sample lesson using R (data download, basic cleaning, one visualization and short interpretation).
- 40-minute structured discussion: strategies to simplify complex datasets for teaching, guiding students from raw to interpretable outputs (maps, trends, indices), and connecting exercises to sustainability and fisheries management.
- Participants share approaches, challenges, and resources to collaboratively improve open-data pedagogy.

## Example lesson flow 

1. Learning objectives (e.g., understand sampling bias in recreational catch data; visualize temporal trend in CPUE).
2. Data access (download data with R).
3. Data wrangling (tidy data, join metadata, handle missingness and sampling effort).
4. Visualization (maps, time series, indices).
5. Interpretation and management implications (bias, uncertainty, quota implications).
6. Assessment & reflection (short write-up or slide describing findings and limitations).

## Repo layout 

- README.md — this file
- workshop.R — starter / blank R script for the lesson 
- data/ — place for small sample CSVs (not included by default)
- docs/ — lesson slides, handouts, or vignette (optional)
- LICENSE — choose a license for materials (consider CC-BY for educational content)

---

