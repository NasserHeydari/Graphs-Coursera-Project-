data <- read.delim("household_power_consumption.txt",header = TRUE,sep = ";")

library(lubridate)

data$Date <- dmy(data$Date)

data <- as.data.frame(data)

subdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

DateTime <- paste(subdata$Date, subdata$Time)

DateTime <- ymd_hms(DateTime,tz=Sys.timezone())

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(DateTime,subdata$Global_active_power,xlab="",ylab = "Global Active Power", type="l")

plot(DateTime,as.numeric(as.character(subdata$Voltage)) ,xlab="datetime",ylab = "Voltage", type="l")


plot(DateTime,subdata$Sub_metering_1,xlab = "",ylab = "Energy Sub Metering", type="l")

lines(DateTime,subdata$Sub_metering_2,col="red")

lines(DateTime,subdata$Sub_metering_3,col="blue")

legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),lty=1,cex=0.5)

plot(DateTime,as.numeric(as.character(subdata$Global_reactive_power)),xlab = "datetime",ylab = "Global_reactive_power", type="l")

dev.copy(png,width = 480, height = 480, units = "px",("plot4.png"))

dev.off()
