##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                      Data import and cleaning script                     ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library(tidyverse)
library(here)
library(janitor)
library(lubridate)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Set up and read in data
# Read in csv files
PRM <- read_csv(here("data", "RioMameyesPuenteRoto.csv"))
BQ1 <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"))
BQ2 <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"))
BQ3 <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"))


### Clean and filter data
# Join all data frames, clean up column names
full_join <- PRM %>% 
  full_join(BQ1) %>% 
  full_join(BQ2) %>% 
  full_join(BQ3) %>% 
  clean_names() 

# Filter data 
filtered_df <- full_join %>% 
  select("sample_id", "sample_date", "no3_n", "k", "mg", "ca", "nh4_n") %>%
  filter(lubridate::year(sample_date) %in% c(1988:1994)) 

### Save as .csv file
write_csv(filtered_df, here("output", "filtered_df.csv"))

