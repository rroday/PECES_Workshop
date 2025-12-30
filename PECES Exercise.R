##
## Date Created: 2025-12-19
##
## Copyright (c) Rachel Roday, 2025
## Email: rroday@udel.edu 
##
---------------------------
  ## Notes:
  ##
  ##
  ##
  ---------------------------
  ######################## Working Directory and Packages ########################

# Load libraries 
library(ggplot2)
library(tidyverse)
library(dplyr)
library(stats)
library(scales)
library(viridis)
library(RColorBrewer)
library(readr)

######################## Loading Data  #########################################


SVDBS_CRUISES <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/25087_SVDBS_CRUISES.csv")

BIO <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/25087_UNION_FSCS_SVBIO.csv")

CATCH <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/25087_UNION_FSCS_SVCAT.csv")

STATION <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/25087_UNION_FSCS_SVSTA.csv")

SVDBS_CLOUD <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/SVDBS_CLOUD.csv")

SVDBS_MATURITY_CODES <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/SVDBS_MATURITY_CODES.csv")

SVDBS_SEX_CODES <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/SVDBS_SEX_CODES.csv")

SVDBS_SVGEAR <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/SVDBS_SVGEAR.csv")

SVDBS_SVMSTRATA <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/SVDBS_SVMSTRATA.csv")

SVDBS_SVSPECIES_LIST <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/SVDBS_SVSPECIES_LIST.csv")

SVDBS_SVVESSEL <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/SVDBS_SVVESSEL.csv")

SVDBS_WEATHER <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/SVDBS_WEATHER.csv")

SVDBS_XBT <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/SVDBS_XBT.csv")


######################## Tidying  Data  ########################################

DF <- BIO %>%
  left_join(SVDBS_MATURITY_CODES,  by = c("MATURITY" = "maturity")) %>%
  left_join(SVDBS_SEX_CODES,       by = c("SEX" = "sex")) %>%
  left_join(SVDBS_SVSPECIES_LIST,  by = "SVSPP")

######################## Visualizing Data  #####################################

DF %>% 
  ggplot(aes(x = COMNAME)) +
  geom_bar(fill = "#ca9fe0", color = "#420761") +
  coord_flip() +
  scale_y_log10(expand = c(0, 0)) +
  theme_bw() +
  labs(x = "Species (Common Name)",
    y = "Count (log scale)")

######################## Figures   #############################################
########################     Figure 1  -  NAME HERE   ##########################


ggsave(filename = "Figure_1.jpeg", plot = last_plot(),
       device = "jpeg",  width = 7.5,  height = 5.5,  units = "in",  dpi = 300)


########################     Figure 2  -  NAME HERE   ##########################
########################     Figure 3  -  NAME HERE   ##########################
########################     Figure 3  -  Statistics  ##########################




######################## Spare Code   ##########################################
