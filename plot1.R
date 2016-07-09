# following 3 lines of code ingest and filter data.
power <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))
power_subset <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
global_active_power <- as.numeric(power_subset$Global_active_power)

# code to create plot and PNG file
hist(global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)

# important. close graphics device
dev.off()