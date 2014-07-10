# Plot 2: Global Active Power

# Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?")

# Extract only the data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date and Time variables
subdata$Time <- strptime(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y%H:%M:%S")
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

# Generate the plot
png(file = "plot2.png")
with(subdata, plot(Time, Global_active_power, xlab ="", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()