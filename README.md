# Pre-Post Design Meta-Analysis

This repository contains an R script for performing a meta-analysis using a pre-post study design. The analysis calculates effect sizes, conducts a random-effects meta-analysis, and generates a forest plot to visualize the results.

**Note:** The sample data provided (`sample_meta_pre_post.csv`) is pseudodata generated using random numbers for practice purposes only. This repository is intended for educational and practice purposes in conducting meta-analyses.

## Files and Directories

- `sample_meta_pre_post.csv`: CSV file containing the pseudodata for the meta-analysis.
- `Sample_analysis_prepost.R`: The main R script performing the analysis.
- `sample.png`: (Optional) Generated forest plot after running the script.
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
 
## Reference
1. Borenstein, M., Hedges, L. V., Higgins, J. P., & Rothstein, H. R. (2011). Introduction to meta-analysis. John Wiley & Sons.
2. Cohen, J. 1969. Statistic power analysis in the behavioral sciences, New York, NY: Academic Press.
3. Hedges, L. V. (1981). Distribution theory for Glass's estimator of effect size and related estimators. journal of Educational Statistics, 6(2), 107-128.
4. Morris, S. B. (2008). Estimating effect sizes from pretest-posttest-control group designs. Organizational research methods, 11(2), 364-386.
5. Scionti, N., Cavallero, M., Zogmaister, C., & Marzocchi, G. M. (2020). Is cognitive training effective for improving Executive Functions in preschoolers? A systematic review and meta-analysis. Frontiers in Psychology, 10, 2812.
6. Viechtbauer, W. (2010). Conducting meta-analyses in R with the metafor package. Journal of statistical software, 36(3), 1-48.
7. The metafor Package: A Meta-Analysis Package for R
http://www.metafor-project.org/doku.php



