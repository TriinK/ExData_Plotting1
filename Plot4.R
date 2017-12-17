#Programming assignment (Exploratory Data Analysis)

data <- read.table('household_power_consumption.txt', sep = ';', check.names = TRUE, col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
data = data[-1, ]
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
result <- subset(data, Date == "2007/02/01" | Date == "2007/02/02")
newTime <- as.POSIXct(paste(result$Date, result$Time), "%d/%m/%Y %H:%M:%S")
result <- cbind(result, newTime)

#Changing factors to numbers
class(result$Sub_metering_1)
result$Sub_metering_1 <- as.numeric(as.character(result$Sub_metering_1))
result$Sub_metering_2 <- as.numeric(as.character(result$Sub_metering_2))
result$Sub_metering_3 <- as.numeric(as.character(result$Sub_metering_3))

#Plotting
par(mfrow=c(2,2))

##First plot
plot(result$newTime,result$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "", cex=.5)

##Secont plot
result$Voltage <- as.numeric(as.character(result$Voltage))
plot(result$newTime,result$Global_active_power, type="l", ylab="Voltage", xlab = "datetime")

##Third plot
plot(result$newTime, result$Sub_metering_1, col = "black", type = "l", ylab="Energy sub metering", xlab="")
lines(result$newTime, result$Sub_metering_2, col="red")
lines(result$newTime, result$Sub_metering_3, col="blue") 
##Remove legend to fit the graph

##Fourth plot
result$Global_reactive_power <- as.numeric(as.character(result$Global_reactive_power))
plot(result$newTime, result$Global_reactive_power, col = "black", type = "l", ylab="Global_reactive_power", xlab="datetime")

##Finalizing
dev.copy(png, file="Plot4.png", width=480, height=480)
dev.off()