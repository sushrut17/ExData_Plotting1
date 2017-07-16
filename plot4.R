setwd("C:/Users/Sushrut/datasciencecoursera/datasciencecoursera/ExData_Plotting1")
power <- read.table("G:/Data Science Specialization/Exploratory Data Analysis/Assignment1/household_power_consumption.txt", sep=";", header = TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power2 <- power[power$Date == "2007-02-01",]
power3 <- power[power$Date == "2007-02-02",]
power4 <- rbind(power2,power3)
power4$Sub_metering_1 <- as.character(power4$Sub_metering_1)
power4$Sub_metering_1 <- as.numeric(power4$Sub_metering_1)
sat_entry <- power[power$Date == "2007-02-03" & power$Time == "00:00:00",]
power5 <- rbind(power4,sat_entry)
power5$Sub_metering_1 <- as.character(power5$Sub_metering_1)
power5$Sub_metering_1 <- as.numeric(power5$Sub_metering_1)

power5$Sub_metering_2 <- as.character(power5$Sub_metering_2)
power5$Sub_metering_2 <- as.numeric(power5$Sub_metering_2)

power5$Sub_metering_3 <- as.character(power5$Sub_metering_3)
power5$Sub_metering_3 <- as.numeric(power5$Sub_metering_3)

x <- paste(power5$Date, power5$Time)
y <- strptime(x, "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

plot(y, power5$Global_active_power, xlab = "" ,ylab = "Global Active Power", type = "n" )
lines(y, power5$Global_active_power)

plot(y, power5$Voltage, xlab = "datetime" ,ylab = "Voltage", type = "n" )
lines(y, power5$Voltage)

plot(y, power5$Sub_metering_1, xlab = "" ,ylab = "Energy sub metering", type = "n" )
lines(y, power5$Sub_metering_1)
lines(y, power5$Sub_metering_2, col = "red")
lines(y, power5$Sub_metering_3, col = "blue")
legend("topright", pch = "-", col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(y, power5$Global_reactive_power, xlab = "datetime" ,ylab = "Global_reactive_power", type = "n" )
lines(y, power5$Global_reactive_power)

dev.off()