#plot 6

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
LA_data <- subset(NEI, fips=="06037")
motorvehicleBAL <- Baltimore_data[Baltimore_data$SCC %in% motorvehicle,]
motorvehicleLA <- LA_data[LA_data$SCC %in% motorvehicle,]

subset_data61 <- aggregate(motorvehicleBAL$Emissions,list(motorvehicleBAL$year),FUN="sum")
subset_data62 <- aggregate(motorvehicleLA$Emissions,list(motorvehicleLA$year),FUN="sum")
names(subset_data61) <- c("Year","Emissions")
names(subset_data62) <- c("Year","Emissions")

## MAKE BETTER!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#plotting
png("plot6.png",height = 560, width = 560)
par(mfrow= c(1,2))
plot(subset_data61$Year,subset_data61$Emissions,pch=19,type="b",col="purple",xlab="Year",ylab="Total Emissions (in tons)",
     main ="Baltimore",
     lwd=2)

plot(subset_data62$Year,subset_data62$Emissions,pch=19,type="b",col="purple",xlab="Year",ylab="Total Emissions (in tons)",
     main="Los Angeles",
     lwd=2)
mtext("Motor vehicle related emissions in 1999-2008",outer=TRUE,side = 3,line=-1.5, cex=2)

dev.off()
#other way to do it that looks better

subset_data63 <- mutate(subset_data61,County = "Baltimore")
subset_data64 <- mutate(subset_data62,County = "Los Angeles")

join <- rbind(subset_data63,subset_data64)

ggpp <- ggplot(join,aes(factor(Year),Emissions,fill=County)) + geom_bar(aes(fill=Year),stat="identity") +  
    theme_bw() + guides(fill=FALSE) + facet_grid(.~County,scales="free",space="free") 
ggpp
#didnt put labels cuz im lazy
