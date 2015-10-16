setwd("~/Documents/Документы/Самообразование/Data Science/R4 Exploratory Data Analysis/Course Project 2")
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")


#1
png("plot1.png")

NEI <- transform(NEI, year = factor(year))

with(NEI, boxplot(Emissions ~ year
                  , log = "y"
                  , ylim=c(0.0001,max(Emissions))
                  )
     )
abline(h = mean(NEI$Emissions), col = "red") 
abline(h = median(NEI$Emissions), col = "blue")

legend("topright", 
       lwd = 1,
       col = c("red", "blue"), 
       legend = c("mean(NEI$Emissions)"
                  , "median(NEI$Emissions)"
                  )
       )

dev.off()



qplot(year, Emissions, data = NEI
      , geom = "jitter"
      , alpha = I(1 / 50)
      )
