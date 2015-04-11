# Preparing data for Plot 4

thisFile <- file("household_power_consumption.txt")
thisPart <- read.table(text = grep("^[1,2]/2/2007", readLines(thisFile), value = TRUE), 
                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                     "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                       sep = ";", header = TRUE)

# Preparing DateTime variable for X-axis
thisPart$Date <- as.Date(thisPart$Date, format = "%d/%m/%Y")
thisPart$DateTime <- as.POSIXct(paste(thisPart$Date, thisPart$Time))


# Creating Plot 4
par(mfrow = c(2,2))
with(thisPart, {
    ## [1]
    plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power", xlab = "")
    
    ## [2]
    plot(Voltage ~ DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
    
    ## [3]
    plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2 ~ DateTime, col = 'Red')
    lines(Sub_metering_3 ~ DateTime, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", cex = 0.8,
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## [4]
    plot(Global_reactive_power ~ DateTime, type = "l", 
        ylab = "Global_reactive_power", xlab = "datetime")
})


# Save to file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("plot4.png has been saved in", getwd())
