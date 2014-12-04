#Plot 4
library(data.table)
hpcData <- fread("./household_power_consumption.txt", sep = ";", na.strings = "?")
hpcData$Date <- as.Date(hpcData$Date, format = "%d/%m/%Y")
limitedData <- subset(hpcData, Date == as.Date("2007-02-01") | Date == "2007-02-02")
datetime <- strptime(paste(limitedData$Date, limitedData$Time), format = "%Y-%m-%d %H:%M:%S")
png(file = "plot4.png", width = 630, height = 630)
par(mfcol = c(2, 2))

plot(datetime, 
     as.numeric(limitedData$Global_active_power), 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")


plot(datetime, 
     as.numeric(limitedData$Sub_metering_1),
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(datetime, 
      as.numeric(limitedData$Sub_metering_2),
      type = "l",
      col = "Red")
lines(datetime, 
      as.numeric(limitedData$Sub_metering_3),
      type = "l",
      col = "Blue")
legend("topright", 
       lty = 1, 
       bty = "n", 
       col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datetime, 
     as.numeric(limitedData$Voltage), 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage",
     yaxt = "n")
axis(side = 2, at= seq(234, 246, by = 2), 
     labels = c(234, "",  238, "", 242, "", 246))
plot(datetime, 
     as.numeric(limitedData$Global_reactive_power), 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()

