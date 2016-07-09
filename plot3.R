# following lines of code ingest and filter data.
power <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))
power_subset <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
global_active_power <- as.numeric(power_subset$Global_active_power)
date_time <- strptime(paste(power_subset$Date, power_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_metering_1 <- as.numeric(power_subset$Sub_metering_1)
sub_metering_2 <- as.numeric(power_subset$Sub_metering_2)
sub_metering_3 <- as.numeric(power_subset$Sub_metering_3)

# plot and output to PNG file
plot(date_time, sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(date_time, sub_metering_2, type = "l", col = "red")
lines(date_time, sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)

# important. close graphics device
dev.off()