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

######################## Loading Data  #########################################

DF <- read_csv(url)

######################## Tidying  Data  ########################################


######################## Visualizing Data  #####################################


######################## Figures   #############################################
########################     Figure 1  -  NAME HERE   ##########################


ggsave(filename = "Figure_1.jpeg", plot = last_plot(),
       device = "jpeg",  width = 7.5,  height = 5.5,  units = "in",  dpi = 300)


########################     Figure 2  -  NAME HERE   ##########################
########################     Figure 3  -  NAME HERE   ##########################
########################     Figure 3  -  Statistics  ##########################




######################## Spare Code   ##########################################