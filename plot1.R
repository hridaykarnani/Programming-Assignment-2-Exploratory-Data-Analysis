#plot 1

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
subset_data <- aggregate(NEI$Emissions,list(NEI$year),FUN="sum")

#plotting
png("plot1.png",height = 480,width = 480)
plot(subset_data,type="b",pch=19,col="green",xlab="Year",ylab="Total Emissions (in tons)",
     main="Total Emissions in the USA per year: 1999-2008",lwd=3)
dev.off()
