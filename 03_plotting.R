##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                            Graph plotting script                         ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
library(here)
library(patchwork)

final_df <- read_csv(here("output", "final_df.csv"))

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Create graph for each nutrient  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Create k graph
figurek <- ggplot(final_df, aes(x = sample_date, y = calc_rolling_k)) +
  geom_line(aes(linetype = sample_id)) +
  labs(x = "Year",
       y = "K mg/l")

# Save output
ggsave(here("output", "figurek.png"))

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Create no3_n graph
figureno3_n <- ggplot(final_df, aes(x = sample_date, y = calc_rolling_no3_n)) +
  geom_line(aes(linetype = sample_id)) +
  labs(x = "Year",
       y = "NO3-N ug/l")

# Save output
ggsave(here("output", "figureno3_n.png"))

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Create mg graph
figuremg <- ggplot(final_df, aes(x = sample_date, y = calc_rolling_mg)) +
  geom_line(aes(linetype = sample_id)) +
  labs(x = "Year",
       y = "Mg mg/l")

# Save output
ggsave(here("output", "figuremg.png"))

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Create ca graph
figureca <- ggplot(final_df, aes(x = sample_date, y = calc_rolling_ca)) +
  geom_line(aes(linetype = sample_id))  +
  labs(x = "Year",
       y = "Ca mg/l")

# Save output
ggsave(here("output", "figureca.png"))

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Create nh4_n graph
figurenh4_n <- ggplot(final_df, aes(x = sample_date, y = calc_rolling_nh4_n)) +
  geom_line(aes(linetype = sample_id)) +
  labs(x = "Year",
       y = "NH4-N ug/l") 

# Save output
ggsave(here("output", "figurenh4_n.png"))


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Final patchwork figure  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Combine all nutrient plots into one figure
patchwork <- (figurek/figureno3_n/figuremg/figureca/figurenh4_n) +
  plot_layout(axes = "collect", guides = "collect")
patchwork & theme_light() +
  theme(
    legend.title = element_text("Site")
  ) 

# Save output
ggsave(here("figs", "patchwork.png"))
       
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Alternative facet-wrapped figure  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Combine all nutrient plots into one figure 
facet <- ggplot(pivot, aes(x = sample_date, y = avg)) +
  geom_line(aes(linetype = sample_id)) +
  facet_wrap(~calc_rolling, scales = "free_y", ncol = 1)

# Save output
ggsave(here("output", "facet.png"))

