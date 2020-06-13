url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists("assignment.zip")) {
        download.file(url, "assignment.zip")
}
if (!file.exists("household_power_consumption.txt")) {
        unzip("assignment.zip")
}
RAWDat <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
Febr <- subset(RAWDat, RAWDat$Date == "1/2/2007" | RAWDat$Date == "2/2/2007")
Febr$DateTime <- as.POSIXct(paste(Febr$Date, Febr$Time), format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

##graph 4 margins
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,4,2))
## top left "(kilowatt)" removed
plot(Febr$DateTime, Febr$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(Febr$DateTime, Febr$Global_active_power)

##top right
plot(Febr$DateTime, Febr$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(Febr$DateTime, Febr$Voltage)

##bottom left - legend border removed
plot(Febr$DateTime, Febr$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(Febr$DateTime, Febr$Sub_metering_1, col = "black")
lines(Febr$DateTime, Febr$Sub_metering_2, col = "red")
lines(Febr$DateTime, Febr$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

##bottom right
plot(Febr$DateTime, Febr$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(Febr$DateTime, Febr$Global_reactive_power)
dev.off()