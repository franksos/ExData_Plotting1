raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                  na.strings = "?", colClasses = c(rep("character",2), rep("numeric",7)))
usedata <- subset(raw, raw$Date == "1/2/2007" | raw$Date == "2/2/2007")
dtchr <- paste(usedata$Date, usedata$Time)
t <- strptime(dtchr, format = "%d/%m/%Y %H:%M:%S")
plot(t, usedata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(t, usedata$Global_active_power)
dev.copy(png, "plot2.png")
dev.off()
