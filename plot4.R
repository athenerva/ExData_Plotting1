## Read source file
hpc <- read.csv2("household_power_consumption.txt", 
                 na.strings = "?", stringsAsFactors = FALSE)

## Subset on required dates
hpc2 <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

## Re-cast all variables in appropriate formats
hpc2$Date <- as.Date(hpc2$Date, "%d/%m/%Y")
hpc2$datetime <- paste(hpc2$Date, hpc2$Time, sep = " ")
hpc2$datetime <- strptime(hpc2$datetime, format = "%d/%m/%Y %H:%M:%S")
hpc2$Global_active_power <- as.numeric(hpc2$Global_active_power)
hpc2$Global_reactive_power <- as.numeric(hpc2$Global_reactive_power)
hpc2$Voltage <- as.numeric(hpc2$Voltage)
hpc2$Global_intensity <- as.numeric(hpc2$Global_intensity)
hpc2$Sub_metering_1 <- as.numeric(hpc2$Sub_metering_1)
hpc2$Sub_metering_2 <- as.numeric(hpc2$Sub_metering_2)
hpc2$Sub_metering_3 <- as.numeric(hpc2$Sub_metering_3)

## Plot 4
par(mfrow = c(2, 2))

## Graph 1
plot(hpc2$datetime, hpc2$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power", cex = 0.7)

## Graph 2
plot(hpc2$datetime, hpc2$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage", cex = 0.7)

## Graph 3
plot(hpc2$datetime, hpc2$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering", cex = 0.7)
points(hpc2$datetime, hpc2$Sub_metering_1, type = "l")
points(hpc2$datetime, hpc2$Sub_metering_2, type = "l", col = "red")
points(hpc2$datetime, hpc2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.2)

## Graph 4
plot(hpc2$datetime, hpc2$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power", cex = 0.7)

## Copy plot to png file
dev.copy(png, file = "plot4.png")
dev.off()