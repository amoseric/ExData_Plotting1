
# Preparing data for Plot 3

thisFile <- file("household_power_consumption.txt")
thisPart <- read.table(text = grep("^[1,2]/2/2007", readLines(thisFile), value = TRUE), 
                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                     "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                       sep = ";", header = TRUE)

# Preparing DateTime variable for X-axis
thisPart$Date <- as.Date(thisPart$Date, format = "%d/%m/%Y")
thisPart$DateTime <- as.POSIXct(paste(thisPart$Date, thisPart$Time))

# Creating Plot 3
par(mfrow=c(1,1))
with(thisPart, {
    plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2 ~ DateTime, col = 'Red')
    lines(Sub_metering_3 ~ DateTime, col = 'Blue')
})
legend("topright", legend = c("Sub_metering_1    ", "Sub_metering_2   ", "Sub_metering_3   "),
       cex = 0.8, lty = 1, col = c("black", "red", "blue"))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png has been saved in", getwd())

