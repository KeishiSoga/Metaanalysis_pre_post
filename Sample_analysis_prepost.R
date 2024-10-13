# Pre-Post Design Meta-Analysis Script
# Author: Keishi Soga
# Date: 2024-10-13
# Description: This script performs a meta-analysis using a pre-post design dataset.
# It calculates effect sizes, conducts the meta-analysis, and generates a forest plot.

# ---------------------------
# 1. Setup and Package Loading
# ---------------------------
rm(list = ls())
# Uncomment the following line to install the 'metafor' package if not already installed
# install.packages("metafor")

# Load necessary libraries
library(metafor)  # For meta-analysis functions

# ---------------------------
# 2. Data Loading and Validation
# ---------------------------

# Define the relative path to the CSV data file
setwd("")#please set your current directory
data_path <- "sample_meta_pre_post.csv"


# Read the data from the CSV file
sample_prepost <- read.csv(data_path)

# Display the first few rows of the dataset
head(sample_prepost)

# Provide a summary of the dataset
summary(sample_prepost)

# ---------------------------
# 3. Data Validation
# ---------------------------

# Define the required variables for the analysis
required_vars <- c(
  "Author", "year", "NC", "NT",
  "MpreC", "MpostC", "MpreT", "MpostT",
  "SpreC", "SpostC", "SpreT", "SpostT"
)


# ---------------------------
# 4. Effect Size and Variance Calculation
# ---------------------------

# Calculate the mean change for Control and Treatment groups
sample_prepost$MchangeC <- sample_prepost$MpostC - sample_prepost$MpreC
sample_prepost$MchangeT <- sample_prepost$MpostT - sample_prepost$MpreT

# Extract relevant variables for calculations
nc       <- sample_prepost$NC
nt       <- sample_prepost$NT
mchangeC <- sample_prepost$MchangeC
mchangeT <- sample_prepost$MchangeT
spreC    <- sample_prepost$SpreC
spreT    <- sample_prepost$SpreT
spostC   <- sample_prepost$SpostC
spostT   <- sample_prepost$SpostT

# Calculate the difference in mean changes between Treatment and Control
D <- mchangeT - mchangeC

# Calculate the pooled standard deviation
Spool <- sqrt(((nt - 1) * spreT^2 + (nc - 1) * spreC^2) / (nt + nc - 2))

# Calculate Cohen's d
d <- D / Spool

# Calculate the variance of d
vd <- ((nt + nc) / (nt * nc)) + ((d^2) / (2 * (nt + nc)))

# Correction factor for small sample sizes (Hedges' g)
J <- 1 - (3 / (4 * (nt + nc - 2) - 1))
g <- J * d

# Variance of Hedges' g
vg <- J^2 * vd

# Assign the calculated effect sizes and variances to the dataset
sample_prepost$yi <- g
sample_prepost$vi <- vg

# ---------------------------
# 5. Meta-Analysis Execution
# ---------------------------

# Perform the random-effects meta-analysis using the 'rma' function
meta_analysis <- rma(yi, vi, data = sample_prepost, method = "REML")

# Display a summary of the meta-analysis results
summary(meta_analysis)

# ---------------------------
# 6. Forest Plot Generation
# ---------------------------

# Create a forest plot of the meta-analysis results
forest(
  meta_analysis,
  slab = paste(sample_prepost$Author, sample_prepost$year, sep = ", "),
  xlab = "Hedges' g",
  mlab = "Overall Effect",
  alim = c(min(sample_prepost$yi - 1.96 * sqrt(sample_prepost$vi)),
           max(sample_prepost$yi + 1.96 * sqrt(sample_prepost$vi)))
)

# Add custom text annotations to the plot
# Adjust the coordinates (-10, 0) as needed based on the plot's scale
text(
  x = -9.6, y = meta_analysis$k + 1.5,  # Positioning the text above the plot
  labels = "Author(s), Year", pos = 4, cex = 1
)
text(
  x = 7.2, y = meta_analysis$k + 1.5,
  labels = "Hedges' g [95% CI]", pos = 2, cex = 1
)

