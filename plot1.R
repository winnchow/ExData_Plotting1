# Plot 1: Global Active Power

# Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?")

# Extract only the data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date and Time variables
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$Time <- strptime(as.character(subdata$Time), format = "%H:%M:%S")

# Generate the plot
png(file = "plot1.png")
with(subdata, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.off()
