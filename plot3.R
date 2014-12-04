#Plot 3
library(data.table)
hpcData <- fread("./household_power_consumption.txt", sep = ";", na.strings = "?")
hpcData$Date <- as.Date(hpcData$Date, format = "%d/%m/%Y")
limitedData <- subset(hpcData, Date == as.Date("2007-02-01") | Date == "2007-02-02")
datetime <- strptime(paste(limitedData$Date, limitedData$Time), format = "%Y-%m-%d %H:%M:%S")
png(file = "plot3.png")
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
       lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


