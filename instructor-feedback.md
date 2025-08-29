---
title: "instructor-feedback"
output: html_document
---

## Exceeds spec

### The code is appropriately commented
My code has descriptive in line comments in a consistent format in each of my scripts. They also each have code titles/headings stating what the script is and what each chunk does. My function (moving_average.R) has a Roxygen skeleton for additional documentation. 

### At least one piece of functionality has been refactored into a function in its own file
My analysis is separated into three sequential scripts for data cleaning, calculating the rolling average with a sourced function, and plotting. There is little code in the actual Quarto doc.

## Collaboration
In giving peer feedback, I made sure to be detailed in how they met each spec and what they did well, or if it was not yet met give specific suggestions about what changes to make to meet the spec. For example, I stated that the graphs had correct axes and plotted the rolling averages for each site really well and included a legend, but needed one more graph for a missing nutrient and suggested stacking them using either facet wrap or patchwork in an Issue. I also added an .R file for environment installation in my forked copy and they were able to merge my pull request.

https://github.com/avarobillard/eds214-day1/issues/12
https://github.com/avarobillard/eds214-day1/issues/6
https://github.com/avarobillard/eds214-day1/issues/4

https://github.com/avarobillard/eds214-day1/commit/c75295ce4d7d95c7eb4a7830bbf6e040c3cce8d4

# Instructor feedback

## Automate

[M] **Running the entire analysis requires rendering one Quarto document**

[M] The analysis runs without errors

[M] **The analysis produces the expected output**

[M] **Data import/cleaning is handled in its own script(s)**

## Organize

[M] Raw data is contained in its own folder

[M] Intermediate outputs are created and saved to a separate folder from raw data

[E] **At least one piece of functionality has been refactored into a function in its own file**

- Your code is extremely _modular_ meaning you've done a great job breaking it into discrete chunks (easier to test and maintain) and putting them together (e.g. using source()). Excellent work!!

## Document

[M] The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

[M] **The README includes a flowchart and text explaining how the analysis works**

[E] **The code is appropriately commented**

- Excellent examples of header, inline, and function comments. Professional quality!

[M] **Variable and function names are descriptive and follow a consistent naming convention**

## Scale

After cloning the repo on Workbench:

[M] Running the environment initialization script installs all required packages

[M] The analysis script runs without errors

## Collaborate

[M] **The student has provided attentive, constructive feedback in a peer review**

[M] **The student has contributed to a peer's repo by opening an issue and creating a pull request**

[M] The repo has at least three closed GitHub issues

[M] The commit history includes at least one merged branch and a resolved merge conflict

[M] The rendered analysis is accessible via GitHub PagesM
