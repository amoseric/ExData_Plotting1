# We examine how household energy usage varies over a 2-day period in February, 2007, 
# using the base plotting system.

thisFile <- file("household_power_consumption.txt")
thisPart <- read.table(text = grep("^[1,2]/2/2007", readLines(thisFile), value = TRUE), 
        col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                      "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        sep = ";", header = TRUE)

# Creating Plot 1
par(mfrow=c(1,1))
hist(thisPart$Global_active_power, main = paste("Global Active Power"), col = "red",
      xlab = "Global Active Power (kilowatts)")


dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("Plot1.png has been saved in", getwd())
