data <- read.delim("household_power_consumption.txt",header = TRUE,sep = ";")

library(lubridate)

data$Date <- dmy(data$Date)

data <- as.data.frame(data)

subdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

DateTime <- paste(subdata$Date, subdata$Time)

DateTime <- ymd_hms(DateTime,tz=Sys.timezone())

subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))

plot(DateTime,subdata$Global_active_power,xlab = "",ylab = "Global Active Power(kilowatts)", type="l")

dev.copy(png,width = 480, height = 480, units = "px",("plot2.png"))

dev.off()