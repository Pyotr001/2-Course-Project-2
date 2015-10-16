## Have total emissions from PM2.5 decreased in the United States from 1999 to 
## 2008? Using the base plotting system, make a plot showing the total PM2.5 
## emission from all sources for each of the years 1999, 2002, 2005, and 2008.


NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
# options(scipen=7)  # A penalty to be applied when deciding to print numeric values in fixed or exponential notation. 


sumEmissions <- tapply(NEI$Emissions, NEI$year, sum) # суммирую по фактору и создаю вектор
barplot(sumEmissions/1000000, ylab = "millions of tons / year") # подписи взял из имен вектора


# # sumEmissions <- data.frame(sumEmissions, names(sumEmissions)
#                            , row.names = NULL) # создаю фрейм
# names(sumEmissions) <- c("TotalEmissions", "Year")
# 
# plot(sumEmissions$Year, sumEmissions$TotalEmissions/1000000
#      , type = "b" ## ничего не меняет
#      , xlab = "Year"
#      , ylab = "Total Emissions (million tons)"
#      )


dev.copy(png, file = "plot1.png")
dev.off()

# версия третья2 
library(dplyr)
group_NEI <- group_by(NEI, year)
sum <- summarise(group_NEI, Emissions)
barplot(sum[[2]])
barplot(sum[[2]]/100000, names.arg = sum$year)
