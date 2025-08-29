##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                     Rolling average calculation script                   ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
library(tidyverse)
library(here)

# Source functions
source(here("R", "moving_average.R"))

filtered_df <- read_csv(here("output", "filtered_df.csv"))

## Determine rolling averages of each nutrient by site

filtered_df <- filtered_df %>% 
  group_by(sample_id) %>% # Group by sample id 
  mutate( # Add column for each nutrient
    # Column for rolling average of k concentration
    calc_rolling_k = sapply(sample_date,
                            moving_average,
                            dates = sample_date,
                            conc = k,
                            win_size_wks = 9),
    
    # Column for rolling average of no3_n concentration
    calc_rolling_no3_n = sapply(sample_date,
                                moving_average,
                                dates = sample_date,
                                conc = no3_n,
                                win_size_wks = 9),
    
    # Column for rolling average of mg concentration
    calc_rolling_mg = sapply(sample_date,
                             moving_average,
                             dates = sample_date,
                             conc = mg,
                             win_size_wks = 9),
    
    # Column for rolling average of ca concentration
    calc_rolling_ca = sapply(sample_date,
                             moving_average,
                             dates = sample_date,
                             conc = ca,
                             win_size_wks = 9),
    
    # Column for rolling average of nh4_n concentration
    calc_rolling_nh4_n = sapply(sample_date,
                                moving_average,
                                dates = sample_date,
                                conc = nh4_n,
                                win_size_wks = 9)
  ) %>% 
  # Ungroup for any further analyses with data frame
  ungroup()

# Save output
write_csv(final_df, here("output", "final_df.csv"))

