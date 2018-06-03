data <- read.delim("household_power_consumption.txt",header = TRUE,sep = ";")

library(lubridate)

data$Date <- dmy(data$Date)

data <- as.data.frame(data)

subdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

DateTime <- paste(subdata$Date, subdata$Time)

DateTime <- ymd_hms(DateTime,tz=Sys.timezone())

subdata$Sub_metering_1 <- as.numeric(as.character(subdata$Sub_metering_1))

subdata$Sub_metering_2 <- as.numeric(as.character(subdata$Sub_metering_2))

subdata$Sub_metering_3 <- as.numeric(as.character(subdata$Sub_metering_3))

plot(DateTime,subdata$Sub_metering_1,xlab = "",ylab = "Energy Sub Metering", type="l")

lines(DateTime,subdata$Sub_metering_2,col="red")

lines(DateTime,subdata$Sub_metering_3,col="blue")

legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),lty=1)

dev.copy(png,width = 480, height = 480, units = "px",("plot3.png"))

dev.off()
