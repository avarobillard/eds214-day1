---
title: "self-assessment"
output: html_document
---

## Automate
### Running entire analysis requires rendering one Quarto doc
Meets spec- 
The entire analysis from loading libraries, reading in and cleaning data, 
sourcing other functions and applying them, and finally graphing the results 
can be done by rendering the quarto document.

### Analysis runs without errors
Meets spec-
No errors occur when running each code chunk and rendering the overall quarto 
document.

### Analysis produces expected output
Not yet-
The graph does not reflect Figure 3 in the paper exactly yet, especially in the
amount of sites that get graphed in the subplots.

### Data import/cleaning is handled in its own script
Not yet-
The data import and cleaning code is in the main quarto doc.


## Organize
### Raw data is contained in its own folder
Meets spec-
The four raw .csv files are all located in the data folder, with no other files.

### Intermediate outputs are created and saved to a separate folder from raw data
Not yet-
There are no intermediate outputs stored anywhere yet, just in the environment.

### At least one piece of functionality has been refactored into a function in its own file
Meets spec-
Taking a rolling mean of the data has been made into a function called moving_average. It has been relocated to an .R script in the R folder,
and is only sourced in the quarto doc.

## Document
### The repo has a README that explains where to find data, analysis script, supporting code, and outputs
Not yet- 
The README does not yet explain where all the pieces can be found, it needs to 
be updated based on how I am organizing my folders and files.

### The README includes a flowchart and text explaining how the analysis works
Not yet-
The README does not yet include a flowchart or an explanation of how the analysis 
works.

### The code is appropriately commented
Meets spec-
The code is separated into chunks and titled with headings, as well as commented within the sections describing what each step of the code does. The formatting is consistent and is pretty concise.

### Variable and function names are descriptive and follow a consistent naming convention
Not yet-
Some are titled well but are lengthy, and data frames could be titled more descriptively. 

## Scale
### Running environment initialization script installs all required packages
Meets spec-
Running the script installs all of the packages

### Analysis script runs without errors
Meets spec-
The script runs without errors
