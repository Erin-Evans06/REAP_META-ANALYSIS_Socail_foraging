#This script will calculate odds ratio from data from Clement et al 2017 (doi:10.1093/beheco/arx056)
#Data were downloaded from dryad on June 27 2024 from doi.org/10.5061/dryad.4g74f

################
#setup
################
library(tidyverse)
library(effectsize)
################
#load data
################
Clement_etal_2017_data <- read_csv("data_extraction/Clement_etal_2017_data.csv")


#reduce to observations we need (no NA for first approach or group size)
Clement_etal_2017_data.r <- Clement_etal_2017_data %>%
  filter(complete.cases(`Group size`) & complete.cases(`First approach (to True or False stimulus)`))

#this brings us to 477 samples, the same as N in figure one

#We want output to be 0,1 for modeling instead of T/F
Clement_etal_2017_data.r <- Clement_etal_2017_data.r %>%
  mutate(First_approach_binomial = ifelse(`First approach (to True or False stimulus)` == "TRUE",1,0))

#Now, we will build our own model for the data
glm <- glm(First_approach_binomial ~ `Group size`, family  = "binomial", data = Clement_etal_2017_data.r)
  
#let's plot to visualize
ggplot(Clement_etal_2017_data.r) +
  geom_point(aes(x = `Group size`, y =First_approach_binomial)) +
  stat_smooth(aes(x = `Group size`, y =First_approach_binomial),method = "glm",method.args = list(family = "binomial")) +
  theme_classic()

#calculate odds ratio
exp(cbind(OR = coef(glm), confint(glm)))

#Odds ratio is 1.05 (confidence interval = 1.01-1.08)
#that means, for one unit increase in group size, the odds of approaching a true stimulus on the first approach increases by a factor of 1.05

#tabulate the number true and false for the oddsratio to r function
table(Clement_etal_2017_data.r$First_approach_binomial)

#how many were false? 188

#how many were true? 289


#convert odds ratio to point-biserial correlation
oddsratio_to_r(1.05, n1 = 289,n2 = 188 , log = FALSE)

#r = 0.01317

