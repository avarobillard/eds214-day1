library(here)
library(tidyverse)
library(dplyr)
library(janitor)

# read in csv files
PRM <- read_csv(here("data", "RioMameyesPuenteRoto.csv"))
BQ1 <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"))
BQ2 <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"))
BQ3 <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"))

# make really big data frame
full_join <- PRM %>% 
  full_join(BQ1) %>% 
  full_join(BQ2) %>% 
  full_join(BQ3) %>% 
  clean_names() 

# make data frame smaller 
filtered_df <- full_join %>% 
  select("sample_id", "sample_date", "no3_n", "k", "mg", "ca", "nh4_n") %>%
  filter(lubridate::year(sample_date) %in% c(1988:1995)) #%>% 
  #mutate(day_of_year <- lubridate::yday(sample_date))

# try to get 9 week averages
# include in mean + or - 4.5 weeks from given date
# 4.5 weeks = 31.5 days
dates <- seq(from = as.Date("1989-01-01"), to = as.Date("1994-01-01"), by = 30)
means <- c(seq_along(dates))
get_means <- function(){
  for (i in seq_along(dates)){
    last_day <- dates[i] + 32
    first_day <- dates[i] - 32
    date_range <- filtered_df %>% 
      filter(filtered_df$sample_date <= last_day & filtered_df$sample_date >= first_day)
    mean_k <- mean(date_range$k, na.rm = TRUE)
    means[i] <- mean_k
  }
  return(means)
}

get_means_attempt2 <- function(){
  for (i in seq_along(dates)){
    if filtered_df$sample_date > dates[i+1]:
     
  }
}
  

#sapply(mean(dates_found))

# try a pivot longer dataset
pivot_for_graph <- filtered_df %>% 
  pivot_longer(cols = c("n03_n", "k", "mg", "ca", "nh4_n"), names_to = nutrient, values_to = mg/L)

# figure out how to facet wrap vertically, and aes(line = site_id) or something to make one plot
# for each nutrient
# ggplot skeleton
figurek <- ggplot(filtered_df, aes(x = sample_date #change to averages, y = k)) +
  geom_line(aes(linetype = sample_id)) 
  #facet_wrap(~k)

# or.. 
library(patchwork)

(figurek/figuren03/figuremg/figureca/figurenh4) & theme(minimal())

figurek
