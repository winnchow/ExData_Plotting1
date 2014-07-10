# Plot 3: Energy sub metering

# Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?")

# Extract only the data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date and Time variables
subdata$Time <- strptime(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y%H:%M:%S")
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

# Generate the plot
png(file = "plot3.png")
with(subdata, plot(Time, Sub_metering_1, xlab ="", ylab = "Energy sub metering", type = "l"))
with(subdata, points(Time, Sub_metering_2, type = "l", col = "red"))
with(subdata, points(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()