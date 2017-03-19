raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
        na.strings = "?", colClasses = c(rep("character",2), rep("numeric",7)))
usedata <- subset(raw, raw$Date == "1/2/2007" | raw$Date == "2/2/2007")
hist(usedata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
        main = "Global Active Power")
dev.copy(png, "plot1.png")
dev.off()