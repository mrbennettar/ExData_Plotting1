data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
# data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# data$Time <- strptime(data$Time, format = "%H:%M:%S")
library("lubridate")
data$DateTime <- paste0(data$Date, sep=" ", data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png(filename = "plot3.png", width = 480, height = 480)

with(data2, plot(DateTime, Sub_metering_1, type="l", main = NULL, , xlab = "", ylab = "Energy sub metering"))
with(data2, lines(DateTime, Sub_metering_2, col = "red"))
with(data2, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"))


dev.off()