##plot 3

##libraries
library(ggplot2)


#downloading file and setting working directory, the wd is personal.
setwd("C:/Users/Hriday/Documents/R/win-library/4.0/Data_Science_R_Coursera/Exploratory_Data_Analysis/project2")

urldata <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urldata,"project2data.zip",method = "curl")
outDir <- "C:/Users/Hriday/Documents/R/win-library/4.0/Data_Science_R_Coursera/Exploratory_Data_Analysis/project2/"
unzip("project2data.zip",list=TRUE)

# reading data
NEI <- readRDS("./project2data/summarySCC_PM25.rds")
SCC <- readRDS("./project2data/Source_Classification_Code.rds")

#subsetting the important data
Baltimore_data <- subset(NEI, fips=="24510")
subset_data3 <- aggregate(Baltimore_data$Emissions,list(Baltimore_data$year,Baltimore_data$type),FUN="sum")
names(subset_data3) <- c("Year","type","TotalEmissions")

#plotting
png("plot3.png",height = 560,width=560)
with(subset_data3,qplot(Year,TotalEmissions,colour= type))+geom_line() + 
    labs(title="Total Emissions in Baltimore City, Maryland, according to each type: 1999-2008",
         x="Year",y="Total Emissions (in tons)")
dev.off()