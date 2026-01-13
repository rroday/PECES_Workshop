##
## Date Created: 2025-12-19 (updated 2026-01-12)
##
## Copyright (c) Rachel Roday, 2025
## Email: rroday@udel.edu 
##
---------------------------
  ## Notes:
  ##      Data were downloaded from NOAA.gov at the following URL:
  ##      https://www.fisheries.noaa.gov/resource/data/northern-shrimp-survey-data
  ##
  ##      Code and data are housed in the following Repo: 
  ##      https://github.com/rroday/PECES_Workshop
  ##
  ##
  ##
  ##  Step 1: Identify a dataset (done for you - we're working with skrimps)
  ##  Step 2: Isolate a simple question
  ##          Metric vs species vs temporal scale vs spatial scale 
  ##                          (Hint: In this shrimp example, temporal and spatial scale both require you to join the station data to any of the biological data...)
  ##  Step 3: Answer your question & build skills
  ##          Guiding questions to help build skills:
  ##          What patterns or trends do you observe in the data over time or space?
  ##          Where do you see the greatest variability or change, and what factors might explain it?
  ##          What aspects of the data are most relevant to a management or sustainability question?
  ##
  ##          (Creating a list of questions to address allows you to focus on the skills needed, rather than checking off boxes) 
  ##  Step 4: Analyze & interpret the results
  ---------------------------
######################## Working Directory and Packages ########################

# Load libraries 
# install.packages("ggplot2", "tidyverse", "dplyr", "stats", "scales", "readr") #you may need to locally install these packages
library(ggplot2)        #graphing
library(tidyverse)      #data wrangling
library(dplyr)          #data wrangling
library(stats)          #certain stats
library(scales)
library(readr)          #read_csv function

######################## Loading Data  #########################################
LENGTH <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/25087_UNION_FSCS_SVLEN.csv")        #this has all the fun data, but was truncated because the file was too large. we are missing 75% of the data
BIO <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/25087_UNION_FSCS_SVBIO.csv")
CATCH <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/25087_UNION_FSCS_SVCAT.csv")
STATION <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/25087_UNION_FSCS_SVSTA.csv")

SVDBS_CRUISES <- read_csv("https://raw.githubusercontent.com/rroday/PECES_Workshop/main/data/25087_SVDBS_CRUISES.csv")
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
colnames(LENGTH) <- gsub('"', '', colnames(LENGTH)) # just do this 

# EXAMPLE CODE: In the following Dataframe, we have joined Bio with the species list, maturity codes, and sex codes
# we have used left_join from the dplyr package to do so
# this is because we dont know the actual maturity stage, etc based on the information available in the BIO dataframe
DF <- BIO %>%
  left_join(SVDBS_MATURITY_CODES,  by = c("MATURITY" = "maturity")) %>%
  left_join(SVDBS_SEX_CODES,       by = c("SEX" = "sex")) %>%
  left_join(SVDBS_SVSPECIES_LIST,  by = "SVSPP")


DF2 %>% () #insert your code here

######################## Visualizing Data  #####################################

# EXAMPLE CODE: In the following figure, we have a histogram of the species found in our DF dataframe
colnames(DF)  #examine the variables available to us
DF %>% 
  ggplot(aes(x = COMNAME)) +
  geom_bar(fill = "#ca9fe0", color = "#420761") +
  coord_flip() +
  scale_y_log10(expand = c(0, 0)) +
  theme_bw() +
  labs(x = "Species (Common Name)",
    y = "Count (log scale)")

DF %>% 
  ggplot(aes(x = COMNAME, group = SEX, fill = as.factor(SEX))) +
  geom_bar() +
  coord_flip() +
  scale_y_log10(expand = c(0, 0)) +
  theme_bw() +
  labs(x = "Species (Common Name)",
       y = "Count (log scale)")

# Using your DF2, create a figure that summarises your data. Get funky with it. Make a map, Word cloud, sankey diagram, pie chart, etc!
# also feel free to not pipe - if you are more familiar with base R or something else, go for it!

DF2 %>% () #insert your code here
  
######################## Figures   #############################################
########################     Figure 1  -  Species Count Bar Graph   ############

# EXAMPLE CODE: You can place final versions of figures here, to separate out from test runs
# R markdowns are best for organizing chunks of code, but intro students find .R files less of a barrier
# hence why these code chunks are organized this way (it makes sense to me...)
DF %>% 
  ggplot(aes(x = fct_infreq(str_to_sentence(COMNAME)))) +
  geom_bar(fill = "#ca9fe0", color = "#420761") +
  coord_flip() +
  scale_y_log10(expand = c(0, 0)) +
  theme_bw() +
  labs(x = "Species",
       y = "Count (log scale)") +
  theme(panel.grid = element_blank())

# save plot to local computer 
ggsave(filename = "Figure_1.jpeg", plot = last_plot(), device = "jpeg",  width = 7.5,  height = 5.5,  units = "in",  dpi = 300) 


########################     Figure 2  -  NAME HERE   ##########################
########################     Figure 2  -  Statistics  ##########################

# You can run statistics here or evaluate trends

########################     Figure 3  -  NAME HERE   ##########################
########################     Figure 3  -  Statistics  ##########################

######################## Spare Code   ##########################################

# You can place spare or junk code here. Make sure to comment out before saving your file :)
