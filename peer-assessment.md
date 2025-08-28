# Peer Assessment (Sofia S)

## Automate
### Running the entire analysis requires rendering one Quarto doc.
Meets! Quarto doc runs nicely.

### The analysis runs without errors.
Meets, n errors! Figure in the end pops up and looks great,

### The analysis produces the expected output
Meets, plot looks a lot like the figure in the paper.

### Data import/cleaning is handled in its own script.
Not yet, data import/cleaning is still in the main quarto doc. I suggest moving it from the quarto doc into its own R file, saving it as a csv, and then calling it into your quarto doc after.

## Organize
### Raw Data in its own folder
Meets.

### Intermediate outputs are created and saved to separate folder from raw data.
Not yet, intermediate outputs like cleaned dataset and figures are still only housed in local environment and not yet saved on their own within the project. That was probably the next step, though.

### At least one piece of functionality has been refactored in its own file.
Meets.

## Document
### Repo has README that explains where to find data, analysis, supporting code, and outputs.
Meets, README is very nicely organized. Some spots are still missing but surely will be filled in as the rest of the analysis is finalized.

### README has a flowchart and text explaining analysis.
Not yet. Analysis isn't explained yet and README does not include a flowchart.

### Code is appropriately commented.
Meets! Code is commented well.

### Variable and function names are descriptive and follow a consistent naming convention

## Scale
### Running environment initialization script installs required packages
Meets, there is an environment_installation script that has all of the necessary packages.

### Analysis script runs without errors
Meets, no errors!