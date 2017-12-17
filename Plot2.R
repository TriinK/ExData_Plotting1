#Programming assignment (Exploratory Data Analysis)

data <- read.table('household_power_consumption.txt', sep = ';', check.names = TRUE, col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
data = data[-1, ]
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
result <- subset(data, Date == "2007/02/01" | Date == "2007/02/02")
newTime <- as.POSIXct(paste(result$Date, result$Time), "%d/%m/%Y %H:%M:%S")
result <- cbind(result, newTime)
plot(result$newTime,result$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="Plot2.png", width=480, height=480)
dev.off()