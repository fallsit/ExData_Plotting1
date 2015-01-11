url<-“https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip”
download.file(url, destfile = "household_power_consumption.zip" , method="curl")
#set the Parameters  & download the zip file

unzip("household_power_consumption.zip")
#unzip the file

hpc <- file("household_power_consumption.txt")
ba <- read.table(text = grep("^[1,2]/2/2007", readLines(hpc), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , sep=";")
png(file="plot1.png", height=480, width = 480)

hist(ba$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()