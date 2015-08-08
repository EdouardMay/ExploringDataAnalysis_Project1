fulldata<-read.table("household_power_consumption.txt",sep=";",na.strings ="?", header =T)
date1 <- "2007-02-01"
date1 <- strptime(date1,"%Y-%m-%d")

date2 <- "2007-02-03"
date2 <- strptime(date2,"%Y-%m-%d")

fulldata$Newdate <- strptime(paste(fulldata$Date,fulldata$Time),"%d/%m/%Y %T")

projectdata <- fulldata[(fulldata$Newdate>=date1 & fulldata$Newdate<date2),]

rm(fulldata)

plot3<-"plot3.png"

png(plot3,width = 480, height = 480)
plot(x=projectdata$Newdate,y=projectdata$Sub_metering_1,xlab="",ylab="Energy sub metering",type = "l")
lines(x=projectdata$Newdate,y=projectdata$Sub_metering_2,col="red")
lines(x=projectdata$Newdate,y=projectdata$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()