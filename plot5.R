##plot 5

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
motorvehicle <- SCC[grep("Onroad",SCC$Data.Category),"SCC"]
Baltimore_data <- subset(NEI, fips=="24510")
motorvehicleBAL <- Baltimore_data[Baltimore_data$SCC %in% motorvehicle,]

subset_data5 <- aggregate(motorvehicleBAL$Emissions,list(motorvehicleBAL$year),FUN="sum")

#plotting
png("plot5.png")
plot(subset_data5,type="b",pch=19,col="purple",xlab="Year",ylab="Total Emissions (in tons)",
     main="Total Motor Vehicle related emissions in the USA: 1999-2008",lwd=2)
dev.off()
# other way to do it that looks better
barplot(subset_data5$x,names.arg=subset_data5$Group.1,col="purple")
#didnt put labels cuz im lazy
