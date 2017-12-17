#Programming assignment (Exploratory Data Analysis)

data <- read.table('household_power_consumption.txt', sep = ';', check.names = TRUE, col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
data = data[-1, ]
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
result <- subset(data, Date == "2007/02/01" | Date == "2007/02/02")
result$Global_active_power <- as.numeric(result$Global_active_power)
hist(result$Global_active_power, main = "Global active power", xlab = "Global active power (kilowatts)", col = 'red')
dev.copy(png, file="Plot1.png", width=480, height=480)
dev.off()

