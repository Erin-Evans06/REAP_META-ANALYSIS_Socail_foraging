#Load required packages from library
library(ggplot2)
library(tidyverse)
#Load .csv and name year_data
year_data <- read.csv("year_data.csv")
#Look at data
head(year_data)
#Summarize data by year
year_sum <- year_data %>%
  group_by(Year) %>%
  add_count(Data)

#Plot Data into
ggplot(year_sum, aes(x=Year,y=n,color=Data)) +
  geom_line() + labs(title = "Prevalence of Research over Time",
                     x = "Year",
                     y = "Number of Publications")
