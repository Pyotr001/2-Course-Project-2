## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (fips == 24510) from 1999 to 2008? Use the base plotting system 
## to make a plot answering this question.

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
# options(scipen=7)  # A penalty to be applied when deciding to print numeric values in fixed or exponential notation. 

BaltimoreEmissions <- tapply(NEI$Emissions[NEI$fips == "24510"]
                       , NEI$year[NEI$fips == "24510"]
                       , sum
                       ) # суммирую по фактору и создаю вектор

barplot(BaltimoreEmissions/1000, ylab = "thousand of tons / year")

dev.copy(png, file = "plot2.png")
dev.off()




BaltimoreEmissions <- data.frame(sumEmissions, names(sumEmissions)
                           , row.names = NULL) # создаю фрейм
names(sumEmissions) <- c("TotalEmissions", "Year")

plot(sumEmissions$Year, sumEmissions$TotalEmissions
     , type = "h" ## ничего не меняет
     , xlab = "year"
     , ylab = "Total Emissions (tons)"
)


dev.copy(png, file = "plot1.png")
dev.off()
