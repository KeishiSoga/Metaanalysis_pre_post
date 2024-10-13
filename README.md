# Pre-Post Design Meta-Analysis

This repository contains an R script for performing a meta-analysis using a pre-post study design. The analysis calculates effect sizes, conducts a random-effects meta-analysis, and generates a forest plot to visualize the results.

**Note:** The sample data provided (`sample_meta_pre_post.csv`) is pseudodata generated using random numbers for practice purposes only. This repository is intended for educational and practice purposes in conducting meta-analyses.

## Files and Directories

- `data/sample_meta_pre_post.csv`: CSV file containing the pseudodata for the meta-analysis.
- `scripts/meta_analysis.R`: The main R script performing the analysis.
- `results/forest_plot.png`: (Optional) Generated forest plot after running the script.
- `README.md`: This file, providing an overview and instructions.


## Variable Definitions

The dataset `sample_meta_pre_post.csv` should contain the following variables:

### Control Group Variables

- **NC**: Number of participants in the Control group.
- **MpreC**: Pre-test mean for the Control group.
- **MpostC**: Post-test mean for the Control group.
- **SpreC**: Pre-test standard deviation for the Control group.
- **SpostC**: Post-test standard deviation for the Control group.

### Training Group Variables

- **NT**: Number of participants in the Training group.
- **MpreT**: Pre-test mean for the Training group.
- **MpostT**: Post-test mean for the Training group.
- **SpreT**: Pre-test standard deviation for the Training group.
- **SpostT**: Post-test standard deviation for the Training group.

### Calculated Variables

The script will calculate the following additional variables:

- **MchangeC**: Mean change for the Control group (`MpostC - MpreC`).
- **MchangeT**: Mean change for the Training group (`MpostT - MpreT`).
- **spchangeC**: Standard deviation of the change scores for the Control group.
- **spchangeT**: Standard deviation of the change scores for the Training group.
- **yi**: Hedges' g effect size.
- **vi**: Variance of Hedges' g.

## Purpose

This repository is designed for practicing and learning how to conduct meta-analyses using a pre-post study design. The pseudodata provided allows users to familiarize themselves with the workflow without requiring access to real study data.

## Requirements

- **R Packages**:
  - `metafor`


