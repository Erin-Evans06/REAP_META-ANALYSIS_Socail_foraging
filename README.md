#Install required packages
install.packages("ggplot2")

#Load required packages from library
library(ggplot2)

#Load .csv and name year_data
year_data <- read.csv("year_data.csv")

#Look at data 
head(year_data)

#Plot Data into 
ggplot(year_data, aes(x=number,y=Yesear, color=CoNotiaNos))+geom_point()
