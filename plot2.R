##plot 2

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
Baltimore_data <- subset(NEI,fips=="24510")
subset_data2 <- aggregate(Baltimore_data$Emissions,list(Baltimore_data$year),FUN="sum")

#plotting
png("plot2.png")
plot(subset_data2,type="b",pch=19,col="red",xlab="Year",ylab="Total Emissions (in tons)",
     main="Total Emissions per year in Baltimore City, Maryland: 1999-2008",lwd=2)
dev.off()