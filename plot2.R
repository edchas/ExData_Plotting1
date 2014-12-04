#Plot 2
library(data.table)
hpcData <- fread("./household_power_consumption.txt", sep = ";", na.strings = "?")
hpcData$Date <- as.Date(hpcData$Date, format = "%d/%m/%Y")
limitedData <- subset(hpcData, Date == as.Date("2007-02-01") | Date == "2007-02-02")
datetime <- strptime(paste(limitedData$Date, limitedData$Time), format = "%Y-%m-%d %H:%M:%S")
png(file = "plot2.png")
plot(datetime, 
     as.numeric(limitedData$Global_active_power), 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
