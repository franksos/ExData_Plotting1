raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                  na.strings = "?", colClasses = c(rep("character",2), rep("numeric",7)))
usedata <- subset(raw, raw$Date == "1/2/2007" | raw$Date == "2/2/2007")
dtchr <- paste(usedata$Date, usedata$Time)
t <- strptime(dtchr, format = "%d/%m/%Y %H:%M:%S")
par(mfcol=c(2,2))
## plot fig 1
plot(t, usedata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(t, usedata$Global_active_power)
## plot fig 2
plot(t, usedata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(t, usedata$Sub_metering_1)
lines(t, usedata$Sub_metering_2, col = "red")
lines(t, usedata$Sub_metering_3, col = "blue")
legend("topright", legend = names(usedata[7:9]), col = c("black","red", "blue"), lwd = 1, cex = 0.5)
## plot fig 3
plot(t, usedata$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(t, usedata$Voltage)
## plot fig 4
plot(t, usedata$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Globe_reactive_power")
lines(t, usedata$Global_reactive_power)
dev.copy(png, "plot4.png")
dev.off()