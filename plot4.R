url<-“https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip”
download.file(url, destfile = "household_power_consumption.zip" , method="curl")
#set the Parameters  & download the zip file

unzip("household_power_consumption.zip")
#unzip the file

hpc <- file("household_power_consumption.txt")
ba <- read.table(text = grep("^[1,2]/2/2007", readLines(hpc), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , sep=";")
ba$Datetime <- strptime(paste(ba$Date, ba$Time), "%d/%m/%Y %H:%M:%S")
Sys.setlocale('LC_TIME', 'C') 
png(file="plot4.png", height=480, width = 480)par(mfrow = c(2, 2))plot(ba$Datetime, ba$Global_active_power, type = "l", ylab = "Global Active Power",     xlab = "")

plot(ba$Datetime, ba$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")plot(ba$Datetime, ba$Sub_metering_1, type = "l", ylab = "Energy sub metering",     xlab = "", col = "black")points(ba$Datetime, ba$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2",     col = "red")points(ba$Datetime, ba$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3",     col = "blue")legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1",     "Sub_metering_2", "Sub_metering_3"), bty = "n", )plot(ba$Datetime, ba$Global_reactive_power, type = "l", xlab = "datetime",     ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.off()
