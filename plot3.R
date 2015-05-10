
# plot 3
library(datasets)
power <- read.table("household_power_consumption.txt", sep=";", head=TRUE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
powerSub <- power[power$Date=="2007-02-01" | power$Date=="2007-02-02", ] 
powerSub$DateTime <- paste(powerSub$Date, powerSub$Time, sep=" ")
powerSub$DateTime <- strptime(powerSub$DateTime, format="%Y-%m-%d %H:%M:%S")
plot(powerSub$DateTime, as.numeric(as.character(powerSub$Sub_metering_1)), type="l",  xlab="", ylab="Energy Sub metering")
points(powerSub$DateTime, as.numeric(as.character(powerSub$Sub_metering_2)), type="l", col="red")
points(powerSub$DateTime, as.numeric(as.character(powerSub$Sub_metering_3)), type="l", col= "blue")
legend("topright", lty = 1, cex=.55, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "powerPlot3.png")
dev.off()

