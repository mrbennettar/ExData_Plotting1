data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
# data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# data$Time <- strptime(data$Time, format = "%H:%M:%S")
library("lubridate")
data$DateTime <- paste0(data$Date, sep=" ", data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png(filename = "plot1.png", width = 480, height = 480)

with(data2, hist(Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
title(main = "Global Active Power")

dev.off()

