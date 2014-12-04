#Plot 1
library(data.table)
hpcData <- fread("./household_power_consumption.txt", sep = ";", na.strings = "?")
hpcData$Date <- as.Date(hpcData$Date, format = "%d/%m/%Y")
limitedData <- subset(hpcData, Date == as.Date("2007-02-01") | Date == "2007-02-02")
datetime <- strptime(paste(limitedData$Date, limitedData$Time), format = "%Y-%m-%d %H:%M:%S")
png(file = "plot1.png")
hist(as.numeric(limitedData$Global_active_power), 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     col = "Red") 
dev.off()

