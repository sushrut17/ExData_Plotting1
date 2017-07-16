setwd("C:/Users/Sushrut/datasciencecoursera/datasciencecoursera/ExData_Plotting1")
power <- read.table("G:/Data Science Specialization/Exploratory Data Analysis/Assignment1/household_power_consumption.txt", sep=";", header = TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power2 <- power[power$Date == "2007-02-01",]
power3 <- power[power$Date == "2007-02-02",]
power4 <- rbind(power2,power3)
power4$Global_active_power <- as.character(power4$Global_active_power)
power4$Global_active_power <- as.numeric(power4$Global_active_power)
sat_entry <- power[power$Date == "2007-02-03" & power$Time == "00:00:00",]
power5 <- rbind(power4,sat_entry)
power5$Global_active_power <- as.character(power5$Global_active_power)
power5$Global_active_power <- as.numeric(power5$Global_active_power)


x <- paste(power5$Date, power5$Time)
y <- strptime(x, "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")
#c(1:nrow(power5))
plot(y, power5$Global_active_power, xlab = "" ,ylab = "Global Active Power (kilowatts)", type = "n" )
lines(y, power5$Global_active_power)
dev.off()