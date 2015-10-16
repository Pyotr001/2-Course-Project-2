## Of the four types of sources indicated by the type (point, nonpoint, onroad, 
## nonroad) variable, which of these four sources have seen decreases in 
## emissions from 1999–2008 for Baltimore City? Which have seen increases in 
## emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
## answer this question.



NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(ggplot2)
library(dplyr)

BaltimoreEmissions <- subset(NEI, NEI$fips == "24510")
group_Bal_Emissions  <- group_by(BaltimoreEmissions, year, type)
sum <- summarise(group_Bal_Emissions, sum(Emissions))
names(sum) <- c("year", "type", "Emissions")
qplot(year, Emissions, data = sum
      , col = type
      , geom = "line")




qplot(year, Emissions, data = BaltimoreEmissions
      , stat="summary"
      , fun.y="sum"
      , geom = "line"
      , col = type
      )
## Если год считать фактором, то возникает ошибка. Нужно как-то определять то
## какие линии соединять через aes()


dev.copy(png, file = "plot1.png")
dev.off()
