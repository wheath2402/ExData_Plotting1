url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "assignment.zip")
unzip("assignment.zip")
RAWDat <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
Febr <- subset(RAWDat, RAWDat$Date == "1/2/2007" | RAWDat$Date == "2/2/2007")
Febr$DateTime <- as.POSIXct(paste(Febr$Date, Febr$Time), format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

##Graph 1
hist(Febr$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

##Graph 2
plot(Febr$DateTime, Febr$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(Febr$DateTime, Febr$Global_active_power)

##Graph 3
plot(Febr$DateTime, Febr$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(Febr$DateTime, Febr$Sub_metering_1, col = "black")
lines(Febr$DateTime, Febr$Sub_metering_2, col = "red")
lines(Febr$DateTime, Febr$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

##graph 4
##top right
plot(Febr$DateTime, Febr$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(Febr$DateTime, Febr$Voltage)

##bottom right
plot(Febr$DateTime, Febr$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(Febr$DateTime, Febr$Global_reactive_power)

par(mfrow = c(2,2)) ## then add in from top left row wise