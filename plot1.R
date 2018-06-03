data <- read.delim("household_power_consumption.txt",header = TRUE,sep = ";")

library(lubridate)

data$Date <- dmy(data$Date)

data <- as.data.frame(data)

subdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))

hist(subdata$Global_active_power,xlab = "Global Active Power(kilowatts)",col="red",main="Global Active Power")

dev.copy(png,width = 480, height = 480, units = "px",("plot1.png"))

dev.off()