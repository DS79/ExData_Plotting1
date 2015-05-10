

# plot 2
library(datasets)
power <- read.table("household_power_consumption.txt", sep=";", head=TRUE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
powerSub <- power[power$Date=="2007-02-01" | power$Date=="2007-02-02", ] 
powerSub$DateTime <- paste(powerSub$Date, powerSub$Time, sep=" ")
powerSub$DateTime <- strptime(powerSub$DateTime, format="%Y-%m-%d %H:%M:%S")
plot(powerSub$DateTime, as.numeric(as.character(powerSub$Global_active_power)), type="l",  xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "powerPlot2.png")
dev.off()

