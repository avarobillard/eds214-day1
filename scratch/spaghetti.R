##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                               Script purpose                             ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Read in raw data, clean data, conduct analyses and reproduce a final figure output

##~~~~~~~~~~~~~~~~~
##  ~ Authors  ----
##~~~~~~~~~~~~~~~~~
# Ava Robillard
# Contact email: avarobillard@ucsb.edu

rm(list = ls())

library(here)
library(tidyverse)
library(dplyr)
library(janitor)
library(patchwork)

source(here("R", "moving_average.R"))

# Read in csv files
PRM <- read_csv(here("data", "RioMameyesPuenteRoto.csv"))
BQ1 <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"))
BQ2 <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"))
BQ3 <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"))

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

## Determine rolling averages of each nutrient

# Rolling average of no3_n concentration for all sites 
filtered_df$calc_rolling_no3_n <- sapply(
  # variable to loop over/apply to all of
  filtered_df$sample_date,
  moving_average,
  dates = filtered_df$sample_date,
  conc = filtered_df$n03_n,
  win_size_wks = 9
)

# Rolling average of k concentration for all sites 
filtered_df$calc_rolling_k <- sapply(
  # variable to loop over/apply to all of
  filtered_df$sample_date,
  moving_average,
  dates = filtered_df$sample_date,
  conc = filtered_df$k,
  win_size_wks = 9
)

# Rolling average of mg concentration for all sites 
filtered_df$calc_rolling_mg <- sapply(
  # variable to loop over/apply to all of
  filtered_df$sample_date,
  moving_average,
  dates = filtered_df$sample_date,
  conc = filtered_df$mg,
  win_size_wks = 9
)

# Rolling average of ca concentration for all sites 
filtered_df$calc_rolling_ca <- sapply(
  # variable to loop over/apply to all of
  filtered_df$sample_date,
  moving_average,
  dates = filtered_df$sample_date,
  conc = filtered_df$ca,
  win_size_wks = 9
)

# Rolling average of nh4_n concentration for all sites 
filtered_df$calc_rolling_nh4_n <- sapply(
  # variable to loop over/apply to all of
  filtered_df$sample_date,
  moving_average,
  dates = filtered_df$sample_date,
  conc = filtered_df$nh4_n,
  win_size_wks = 9
)

# Try a pivot longer data set to be able to graph by nutrient
pivot <- filtered_df %>% 
  pivot_longer(cols = c("calc_rolling_no3_n", "calc_rolling_k", "calc_rolling_mg", "calc_rolling_ca", "calc_rolling_nh4_n"), names_to = "calc_rolling", values_to = "avg")

# Facet-wrapped figure
facet <- ggplot(pivot, aes(x = sample_date, y = avg)) +
  geom_line(aes(linetype = sample_id)) +
  facet_wrap(~calc_rolling, scales = "free_y", ncol = 1)

facet

# or.. 

# Patchwork figure
# create k graph
figurek <- ggplot(filtered_df, aes(x = sample_date, y = calc_rolling_k)) +
  geom_line(aes(linetype = sample_id)) +
  labs(x = "Year",
       y = "K mg/l")

# create no3_n graph
figureno3_n <- ggplot(filtered_df, aes(x = sample_date, y = calc_rolling_no3_n)) +
  geom_line(aes(linetype = sample_id)) +
  labs(x = "Year",
       y = "NO3-N ug/l")

# create mg graph
figuremg <- ggplot(filtered_df, aes(x = sample_date, y = calc_rolling_mg)) +
  geom_line(aes(linetype = sample_id)) +
  labs(x = "Year",
       y = "Mg mg/l")

# create ca graph
figureca <- ggplot(filtered_df, aes(x = sample_date, y = calc_rolling_ca)) +
  geom_line(aes(linetype = sample_id)) +
  labs(x = "Year",
       y = "Ca mg/l")

# create nh4_n graph
figurenh4_n <- ggplot(filtered_df, aes(x = sample_date, y = calc_rolling_nh4_n)) +
  geom_line(aes(linetype = sample_id)) +
  labs(x = "Year",
       y = "NH4-N ug/l")

patchwork <- (figurek/figureno3_n/figuremg/figureca/figurenh4_n) +
  plot_layout(axes = "collect", guides = "collect")
patchwork & theme_light()
