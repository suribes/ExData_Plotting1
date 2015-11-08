# Load libraries

# Read data
columns <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
powerConsumption <- read.table("household_power_consumption.txt",skip = 66637, nrows = 2880, sep = ";", stringsAsFactors = F, header = F)
colnames(powerConsumption) <- columns

powerConsumption$Date <- as.Date(powerConsumption$Date, format = "%d/%m/%Y")
datetime <- as.POSIXct(paste(powerConsumption$Date, powerConsumption$Time), format="%Y-%m-%d %H:%M:%S")

# Plot
png(file = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

par(mfrow = c(2,2), mar = c(4, 4, 3, 2))

plot(datetime, powerConsumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(datetime, powerConsumption$Voltage, type = "l",  ylab = "Voltage")

plot(datetime, powerConsumption$Sub_metering_1, xlab = "", ylab = "Energy sub metering",type = "n")
points(datetime, powerConsumption$Sub_metering_1, type = "l")
points(datetime, powerConsumption$Sub_metering_2, type = "l", col = "red")
points(datetime, powerConsumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),  lty = c(1,1,1), yjust = 1, , bty="n")

plot(datetime, powerConsumption$Global_reactive_power, type = "l",  ylab = "Global Reactive Power")
dev.off()

