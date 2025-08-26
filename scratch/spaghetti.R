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
  filter(lubridate::year(sample_date) %in% c(1988:1995)) #%>% 
  #mutate(day_of_year <- lubridate::yday(sample_date)) 

# Create a date sequence for one date every 30 days
dates <- seq(from = as.Date("1989-01-01"), to = as.Date("1994-01-01"), by = 30)

# Function attempts!
# try to get 9 week averages
# include in mean + or - 4.5 weeks from given date
# 4.5 weeks = 31.5 days
# # create empty vector
# k_vals <- c()
# 
# get_means2 <- function(){
#   # for each date
#   for (i in seq_along(dates)){
#     # for each row in filtered_df
#     for (j in 1:nrow(filtered_df)){
#       # get date from df to work with
#       date <- filtered_df$sample_date[j]
#       # if the date is in dates between the first and second date (30 days)
#       if (date %in% c(dates[i]:dates[i+1])){
#         # the first val in k vector is the same k value as date
#         k_vals[i] <- filtered_df$k[j]
#         #also group by site somehow
#       }
#     }
#   # take mean of all k vals
#   mean_k <- mean(k_vals)
#   }
# }

# get_means3 <- function(){
#   # for each date
#   for (i in seq_along(dates)){
#     # for each row in filtered_df
#     for (j in 1:nrow(filtered_df)){
#       # get date from df to work with
#       date <- filtered_df$sample_date[j]
#       # if the date is in dates between the first and second date (30 days)
#       if (date %in% c(dates[i]:dates[i+1])){
#         # the first val in k vector is the same k value as date
#         k_vals[i] <- filtered_df$k[j]
#         #also group by site somehow
#       }
#     }
#     # take mean of all k vals
#     mean_k <- mean(k_vals)
#   }
# } 

# need to create the kvals columns
# filter to correct dates

averages <- c()
get_average <- function(dataframe) {
  for (i in seq_along(dates)) {
    first_day <- dates[i]
    last_day <- dates[i+1]
    for (j in 1:nrow(dataframe)) {
      df_interval <- dataframe %>% 
      filter(first_day <= dataframe$sample_id[j] & dataframe$sample_id[j] <= last_day)
      result <- sapply(df_interval$k, mean)
      averages[i] <- result
      }
  }
}

function(filtered_df)


# Try a pivot longer dataset
  # why- to be able to graph by nutrient
pivot_for_graph <- filtered_df %>% 
  pivot_longer(cols = c("n03_n", "k", "mg", "ca", "nh4_n"), names_to = nutrient, values_to = mg/L)

# Figure out how to facet wrap vertically, and aes(line = site_id) or something to make one plot
# for each nutrient
# ggplot skeleton
figurek <- ggplot(filtered_df, aes(x = sample_date, y = k)) +
  geom_line(aes(linetype = sample_id)) 
  #facet_wrap(~k)

# or.. 
library(patchwork)

(figurek/figuren03/figuremg/figureca/figurenh4) & theme(minimal())

figurek
