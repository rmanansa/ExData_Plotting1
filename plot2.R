# following lines of code ingest and filter data.
power <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))
power_subset <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
global_active_power <- as.numeric(power_subset$Global_active_power)
date_time <- strptime(paste(power_subset$Date, power_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# code to create plot and PNG file
plot(date_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)

# important. close graphics device
dev.off()
