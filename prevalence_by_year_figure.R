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
ggplot(year_sum, aes(x=Year, y=n, fill=Data)) +
  geom_col() +
  labs(x = NULL,y = NULL)+
  theme_classic() +
  theme(plot.title = element_text(hjust=0.5),
        legend.position = c(0.15, 0.8),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size=12),
        axis.line = element_line(size=0.9),
        axis.ticks = element_line(size=1),
        axis.line.x = element_line(color = "black", size = 1),
        axis.line.y = element_line(color = "black", size = 1),
        axis.text = element_text(size = 14, face = "bold")) +
  scale_color_manual(values = data_colors)
  



