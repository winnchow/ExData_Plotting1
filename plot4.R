# Plot 4: Multiple plots

# Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?")

# Extract only the data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date and Time variables
subdata$Time <- strptime(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y%H:%M:%S")
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

# Generate the plot
png(file = "plot4.png")
par(mfcol = c(2, 2))

# 1st plot
with(subdata, plot(Time, Global_active_power, xlab ="", ylab = "Global Active Power (kilowatts)", type = "l"))

# 2nd plot
with(subdata, plot(Time, Sub_metering_1, xlab ="", ylab = "Energy sub metering", type = "l"))
with(subdata, points(Time, Sub_metering_2, type = "l", col = "red"))
with(subdata, points(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 3rd plot
with(subdata, plot(Time, Voltage, xlab ="datetime", ylab = "Voltage", type = "l"))

# 4th plot
with(subdata, plot(Time, Global_reactive_power, xlab ="datetime", ylab = "Global_reactive_power", type = "l"))

dev.off()