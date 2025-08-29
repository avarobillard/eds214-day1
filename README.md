---
title: "README"
output: html_document
---

# Reproduction of a figure from Schaefer et al. (2000)

## Repository purpose

This repository contains code to reproduce Figure 3 within Schaefer et al. (2000), which shows the effects of hurricane disturbance on stream water concentrations in a subset of four tropical forest watersheds of the Luquillo Experimental Forest, Puerto Rico. These watersheds were Puente Roto Mameyes (PRM) and Bisley Quebradas 1, 2, and 3 (BQ1, BQ2, and BQ3).

## Analysis

![](figs/flowchart.png){width="564"}

In order to recreate Figure 3, there were three main analysis steps. First, the raw data was read in and cleaned. Then, the rolling mean of each nutrient concentration over a 9 week window was calculated by site. Lastly, the rolling means were plotted for each nutrient by site over a period of 1988-1995. These plots were then combined into a patchwork figure for comparison.

## Repository structure

The following analysis scripts are located in the root of the project:

-   Analysis script: Scripts can be run sequentially (01_data_cleaning.R, 02_rollingaverages.R, 03_plotting.R).

The following folders are located in the project:

-   Data: Raw data files.
-   Outputs: Cleaned data frames, individual plots and final combined plots.
-   Paper: The final paper Quarto document.
-   R: Any functions sourced in the paper are stored here as well as supporting code.

## Data access

Raw data can be accessed from the Environmental Data Initiative (EDI) Data Portal, in a package titled "Chemistry of stream water from Luquillo Mountains" (see <https://doi.org/10.6073/PASTA/F31349BEBDC304F758718F4798D25458>).

Download the following .csv files:

-   Quebrada one-Bisley (Q1) Chemistry Data

-   Quebrada two-Bisley (Q2) Chemistry Data

-   Quebrada three-Bisley (Q3) Chemistry Data

-   Puente Roto Mameyes (MPR) Chemistry Data

## Contributors

Ava Robillard

## References

McDowell, William H., and USDA Forest Service. International Institute Of Tropical Forestry (IITF). 2024. “Chemistry of Stream Water from the Luquillo Mountains.” Environmental Data Initiative. <https://doi.org/10.6073/PASTA/F31349BEBDC304F758718F4798D25458>.

Schaefer, Douglas. A., William H. McDowell, Fredrick N. Scatena, and Clyde E. Asbury. 2000. “Effects of Hurricane Disturbance on Stream Water Concentrations and Fluxes in Eight Tropical Forest Watersheds of the Luquillo Experimental Forest, Puerto Rico.” Journal of Tropical Ecology 16 (2): 189–207. <https://doi.org/10.1017/s0266467400001358>.
