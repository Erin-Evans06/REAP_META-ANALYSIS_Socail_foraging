#load library 
library(meta)
#Prepare the data
data <- data.frame(
  Study = c(
   "Day_2001_Fig2a",
    "Day_2001_Fig2b",
    "Day_2001Fig2.1a",
    "Day_2001Fig2.1b",
    "Morgan_1987_Fig2",
    "Morgan_1988_Fig1a"
  ),
  COR = c(
    -0.9211,-0.8676,-0.8546,-0.7092,-0.8380,-0.5358
  ),
  lower_CI = c(
    -0.9780,-0.9623,-0.9584,-0.9119,-0.9447,-0.8224
  ),
  upper_CI = c(
    -0.7365,-0.5850,-0.5508,-0.2281,-0.5707,0.0324
  ),
  Weight = c(
    15.4,15.4,15.4,15.4,19.1,19.1
  )
)

# Sort data by COR in ascending order
data <- data[order(data$COR), ]

# Create a meta-analysis object
meta_analysis <- metagen(
  TE = data$COR,
  seTE = (data$upper_CI-data$lower_CI) / (2 * 1.96),
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
       xlim = c(-1, 0), 
       leftcols = c("studlab", "COR", "lower_CI", "upper_CI"),
       leftlabs = c("Study", "COR", "95% CI (lower)", "95% CI (upper)"),
       rightcols = "Weight",
       rightlabs = "% Weight",
       digits = 3,
       colgap = unit(5, "mm"),
       print.tau2 = FALSE,  
       print.Q = FALSE,
       print.QE = FALSE,)
       
       
       