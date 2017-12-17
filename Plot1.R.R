#Programming assignment (Exploratory Data Analysis)

data <- read.table('household_power_consumption.txt', sep = ';', check.names = TRUE, col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
data = data[-1, ]
data$Date <- as.Date( as.character(data$Date), "%d/%m/%y")
hist(subset(data, Date == as.Date('2020-02-01'), select = as.numeric(data$Global_active_power)), main = "Global active power", xlab = "Global active power (kilowatts)", col = 'red')


