#####################
### Preliminaries ###
#####################
# Clearing workspace
rm(list = ls())

# Loading source code
require(openair)
require(tidyverse)

#######################
### Reading in data ###
#######################
# Getting London monitors
sites <- importMeta(all = TRUE) %>%
  # Removing duplicates
  unique()

# Downloading pollutant/weather data
dat <- importAURN(site = unique(sites$code),
                  year = 2018,
                  meta = FALSE,
                  data_type = 'hourly',
                  verbose = FALSE) 

######################
### Saving dataset ###
######################
# Saving database 
save_path <- '/Users/evelyn/Desktop/extended project'


write_csv(dat, 
          file = file.path(save_path, 'GBR_GMs_2018.csv'))
write_csv(sites, 
          file = file.path(save_path, 'GBR_GMs_metadata_2018.csv'))











