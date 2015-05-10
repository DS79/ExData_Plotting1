setwd("/Users/admin/Desktop/coursera/exploratory")
power <- read.table("household_power_consumption.txt", sep=";", head=TRUE)
nrow(power)
ncol(power)
tail(power)
head(power)

as.Date("19/2/2013", format="%d/%m/%Y")
strptime("2007-02-02 23:54:00", format="%Y-%m-%d %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
powerSub$DateTime <- strptime(powerSub$DateTime, format="%Y-%m-%d %H:%M:%S")
min(ttime)
max(ttime)
powerSub <- power[power$Date=="2007-02-01" | power$Date=="2007-02-02", ] 
powerSub$DateTime <- paste(powerSub$Date, powerSub$Time, sep=" ")

head(powerSub, 10)
tail(powerSub)
head(powerSub[is.na(powerSub)==T, ])
head(powerSub[as.character(powerSub$Time)=="?", ])


as.numeric(as.character(power$Global_active_power))
#install.packages("datasets")
library(datasets)
hist( as.numeric(as.character(power$Global_active_power)) , main="Global Active Power", xlab="Global Active Power (kilowatts)", , col="red" )
plot( power$Date, power$Global_active_power, type="l")

max(as.numeric(as.character(powerSub$Global_active_power)))

# plot 1
library(datasets)
power <- read.table("household_power_consumption.txt", sep=";", head=TRUE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
powerSub <- power[power$Date=="2007-02-01" | power$Date=="2007-02-02", ] 
powerSub$DateTime <- paste(powerSub$Date, powerSub$Time, sep=" ")
powerSub$DateTime <- strptime(powerSub$DateTime, format="%Y-%m-%d %H:%M:%S")
hist( as.numeric(as.character(powerSub$Global_active_power)) , main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red" )
dev.copy(png, file = "powerPlot1.png")
dev.off()

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

# plot 4
library(datasets)
power <- read.table("household_power_consumption.txt", sep=";", head=TRUE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
powerSub <- power[power$Date=="2007-02-01" | power$Date=="2007-02-02", ] 
powerSub$DateTime <- paste(powerSub$Date, powerSub$Time, sep=" ")
powerSub$DateTime <- strptime(powerSub$DateTime, format="%Y-%m-%d %H:%M:%S")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(2, 2, 1, 1))
plot(powerSub$DateTime, as.numeric(as.character(powerSub$Global_active_power)), type="l",  xlab="", ylab="Global Active Power")
plot(powerSub$DateTime, as.numeric(as.character(powerSub$Voltage)), type="l",  xlab="datetime", ylab="Voltage")
plot(powerSub$DateTime, as.numeric(as.character(powerSub$Sub_metering_1)), type="l",  xlab="", ylab="Energy Sub metering")
points(powerSub$DateTime, as.numeric(as.character(powerSub$Sub_metering_2)), type="l", col="red")
points(powerSub$DateTime, as.numeric(as.character(powerSub$Sub_metering_3)), type="l", col= "blue")
legend("topright", lty = 1, bty = "n", xjust = 1, yjust = 1, x.intersp = 1, y.intersp = 1, cex=.45, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(powerSub$DateTime, as.numeric(as.character(powerSub$Global_reactive_power)), type="l",  xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file = "powerPlot4.png")
dev.off()
