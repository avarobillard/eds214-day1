##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                               Script purpose                             ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Read in raw data, clean data, conduct analyses and reproduce a final figure output

##~~~~~~~~~~~~~~~~~
##  ~ Authors  ----
##~~~~~~~~~~~~~~~~~
# Ava Robillard
# Contact email: avarobillard@ucsb.edu


library(here)
library(tidyverse)
library(dplyr)
library(janitor)

source(here("R", "moving_average.R"))

rm(list = ls())

# Read in csv files
PRM <- read_csv(here("data", "RioMameyesPuenteRoto.csv"))
BQ1 <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"))
BQ2 <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"))
BQ3 <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"))

# Make really big data frame
full_join <- PRM %>% 
  full_join(BQ1) %>% 
  full_join(BQ2) %>% 
  full_join(BQ3) %>% 
  clean_names() 

# Make data frame smaller 
filtered_df <- full_join %>% 
  select("sample_id", "sample_date", "no3_n", "k", "mg", "ca", "nh4_n") %>%
  # go back and make sure these dates reflect graph!
  filter(lubridate::year(sample_date) %in% c(1988:1995)) 


# moving_average <- function(focal_date, dates, conc, win_size_wks) {
#   # Which dates are in the window?
#   is_in_window <- (dates > focal_date - (win_size_wks / 2) * 7) &
#     (dates < focal_date + (win_size_wks / 2) * 7)
#   # Find the associated concentrations
#   window_conc <- conc[is_in_window]
#   # Calculate the mean
#   result <- mean(window_conc)
# 
#   
#   return(result)
# }

# rolling average of no3_n concentration for all sites 
filtered_df$calc_rolling_no3_n <- sapply(
  # variable to loop over/apply to all of
  filtered_df$sample_date,
  moving_average,
  dates = filtered_df$sample_date,
  conc = filtered_df$n03_n,
  win_size_wks = 9
)

# rolling average of k concentration for all sites 
filtered_df$calc_rolling_k <- sapply(
  # variable to loop over/apply to all of
  filtered_df$sample_date,
  moving_average,
  dates = filtered_df$sample_date,
  conc = filtered_df$k,
  win_size_wks = 9
)

# rolling average of mg concentration for all sites 
filtered_df$calc_rolling_mg <- sapply(
  # variable to loop over/apply to all of
  filtered_df$sample_date,
  moving_average,
  dates = filtered_df$sample_date,
  conc = filtered_df$mg,
  win_size_wks = 9
)

# rolling average of ca concentration for all sites 
filtered_df$calc_rolling_ca <- sapply(
  # variable to loop over/apply to all of
  filtered_df$sample_date,
  moving_average,
  dates = filtered_df$sample_date,
  conc = filtered_df$ca,
  win_size_wks = 9
)

# rolling average of nh4_n concentration for all sites 
filtered_df$calc_rolling_nh4_n <- sapply(
  # variable to loop over/apply to all of
  filtered_df$sample_date,
  moving_average,
  dates = filtered_df$sample_date,
  conc = filtered_df$nh4_n,
  win_size_wks = 9
)

# # Try a pivot longer dataset
#   # why- to be able to graph by nutrient
# pivot_for_graph <- filtered_df %>% 
#   pivot_longer(cols = c("n03_n", "k", "mg", "ca", "nh4_n"), names_to = nutrient, values_to = mg/L)

# Figure out how to facet wrap vertically, and aes(line = site_id) or something to make one plot
# for each nutrient
# ggplot skeleton
figurek <- ggplot(filtered_df, aes(x = sample_date, y = k)) +
  geom_line(aes(linetype = sample_id)) 
  #facet_wrap(~k)

# or.. 
library(patchwork)

# create k graph
figurek <- ggplot(filtered_df, aes(x = sample_date, y = calc_rolling_k)) +
  geom_line(aes(linetype = sample_id)) 

# create no3_n graph
figureno3_n <- ggplot(filtered_df, aes(x = sample_date, y = calc_rolling_no3_n)) +
  geom_line(aes(linetype = sample_id)) 

# create mg graph
figuremg <- ggplot(filtered_df, aes(x = sample_date, y = calc_rolling_mg)) +
  geom_line(aes(linetype = sample_id)) 

# create ca graph
figureca <- ggplot(filtered_df, aes(x = sample_date, y = calc_rolling_ca)) +
  geom_line(aes(linetype = sample_id)) 

# create nh4_n graph
figurenh4_n <- ggplot(filtered_df, aes(x = sample_date, y = calc_rolling_nh4_n)) +
  geom_line(aes(linetype = sample_id)) 

(figurek/figureno3_n/figuremg/figureca/figurenh4_n)

