#load library 
library(meta)
#Prepare the data
data <- data.frame(
  Study = c(
    "Reinthal_1986",
    "Nunes_2012_Fig4a",
    "Nunes_2012_Fig4b",
    "Nunes_2012_Fig4c",
    "Nunes_2012_Fig4d",
    "Nunes_2012_Fig5e",
    "Nunes_2012_Fig6f",
    "Morgan_1987_Fig4a",
    "Morgan_1988_Fig2",
    "Foster_1985_Fig1",
    "Hamilton_2003_Fig2",
    "Harpaz_2020_Fig1c",
    "Hintz_2018_Fig5a",
    "Hintz_2018_Fig5b"
  ),
  COR = c(
    0.4498, 0.7797, 0.6527, 0.7899, 0.6504, 0.3742,
    0.3225, 0.6755, 0.1958, 0.4970, 0.4243, 0.5074,
    0.5071, 0.3649
  ),
  lower_CI = c(
    0.3253, 0.5559, 0.2110, 0.5436, 0.2283, -0.1708,
    -0.3854, 0.2496, -0.3517, 0.3931, 0.0948, 0.2043,
    0.3374, 0.1103
  ),
  upper_CI = c(
    0.5590, 0.8982, 0.8730, 0.9110, 0.8667, 0.7439,
    0.7914, 0.8824, 0.6435, 0.5883, 0.6700, 0.7217,
    0.6450, 0.5746
  ),
  Weight = c(
    24.9, 3.1, 1.7, 2.5, 1.8, 1.7,
    1.0, 1.7, 1.7, 31.8, 4.2, 4.3,
    12.4, 7.3
  )
)

# Sort data by COR in ascending order
data <- data[order(desc(data$Weight)), ]

# Create a meta-analysis object
meta_analysis <- metagen(
  TE = data$COR,
  seTE = (data$upper_CI - data$lower_CI) / (2 * 1.96),
  studlab = data$Study,
  data = data,
  sm = "COR",
  fixed = FALSE,
  random = TRUE,
  method.tau = "REML"
)

# Plot the forest plot with extended x-axis and without random effects model details
forest(meta_analysis,
       xlab = "Correlation Coefficient",
       xlim = c(-1, 1), 
       leftcols = c("studlab", "COR", "lower_CI", "upper_CI"),
       leftlabs = c("Study", "COR", "95% CI (lower)", "95% CI (upper)"),
       rightcols = "Weight",
       rightlabs = "% Weight",
       digits = 3,
       colgap = unit(5, "mm"),
       print.tau2 = FALSE,  
       print.Q = FALSE,
       print.QE = FALSE, 
      
       
       