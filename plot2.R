# Load libraries

# Read data
columns <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
powerConsumption <- read.table("household_power_consumption.txt",skip = 66637, nrows = 2880, sep = ";", stringsAsFactors = F, header = F)
colnames(powerConsumption) <- columns

powerConsumption$Date <- as.Date(powerConsumption$Date, format = "%d/%m/%Y")
datetime <- as.POSIXct(paste(powerConsumption$Date, powerConsumption$Time), format="%Y-%m-%d %H:%M:%S")

# Plot
png(file = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

plot(datetime, powerConsumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
