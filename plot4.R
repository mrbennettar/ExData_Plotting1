data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
# data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# data$Time <- strptime(data$Time, format = "%H:%M:%S")
library("lubridate")
data$DateTime <- paste0(data$Date, sep=" ", data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
with(data2, {
  plot(DateTime,Global_active_power,main = NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
  plot(DateTime, Voltage, type="l", ylab = "Voltage")
  plot(DateTime, Sub_metering_1, type="l", main = NULL, , xlab = "", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, bty = "n", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"))
  plot(DateTime, Global_reactive_power, type = "l")
})

dev.off()
