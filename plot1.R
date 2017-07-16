setwd("C:/Users/Sushrut/datasciencecoursera/datasciencecoursera/ExData_Plotting1")
power <- read.table("G:/Data Science Specialization/Exploratory Data Analysis/Assignment1/household_power_consumption.txt", sep=";", header = TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power2 <- power[power$Date == "2007-02-01",]
power3 <- power[power$Date == "2007-02-02",]
power4 <- rbind(power2,power3)
power4$Global_active_power <- as.character(power4$Global_active_power)
power4$Global_active_power <- as.numeric(power4$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(power4$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", xlim = c(0,6) ,breaks = 12)
#dev.copy(png, file = "plot1.png")
dev.off()