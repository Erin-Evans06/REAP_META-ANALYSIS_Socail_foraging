#Load required packages from library
library(ggplot2)
library(tidyverse)
library(lubridate)
#Load .csv and name fig_b
fig_b <- read.csv("n_vs_dateold.csv")
#Look at data
head(fig_b)
#format date for R
fig_b$Publication.Date <- ym(fig_b$Publication.Date)
#look at data structure 
str(fig_b)
#Plot data
ggplot(fig_b, aes(x=Publication.Date,y=Sample.Size)) + 
  geom_point(color="cyan3",pch=19,alpha= 0.5, size=3) + 
  labs(title = "Sample Size vs Publication Date",x = "Date",y = "Sample Size") + 
  theme_classic()+theme(plot.title = element_text(hjust=0.5))+
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  expand_limits(y = 0) +
  scale_y_log10() 

