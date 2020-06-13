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

png(file = "plot1.png", width = 480, height = 480)
hist(Febr$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()