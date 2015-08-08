fulldata<-read.table("household_power_consumption.txt",sep=";",na.strings ="?", header =T)
date1 <- "2007-02-01"
date1 <- strptime(date1,"%Y-%m-%d")

date2 <- "2007-02-03"
date2 <- strptime(date2,"%Y-%m-%d")

fulldata$Newdate <- strptime(paste(fulldata$Date,fulldata$Time),"%d/%m/%Y %T")

projectdata <- fulldata[(fulldata$Newdate>=date1 & fulldata$Newdate<date2),]

rm(fulldata)

plot1<-"plot1.png"

png(plot1,width = 480, height = 480)
hist(projectdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (killowatts)")
dev.off()