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
# Define colors for 'Yes' and 'No'
data_colors <- c("Yes" = "cyan3", "No" = "coral")

# Plot Data
ggplot(year_sum, aes(x=Year, y=n, color=Data)) +
  geom_line() +
  labs(title = "Prevalence of Research over Time",
       x = "Year",
       y = "Number of Publications") +
  theme_classic() +
  theme(plot.title = element_text(hjust=0.5),,legend.position = c(0.15, 0.8)) +
  scale_color_manual(values = data_colors)



