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

## Plot 1
gap <- hpc2$Global_active_power
hist(gap, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

## Copy plot to png file
dev.copy(png, file = "plot1.png")
dev.off()