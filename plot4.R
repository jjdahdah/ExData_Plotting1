#Read the dataset
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)

#Create new date/time field
data$Full_date <- paste(as.character(data$Date),as.character(data$Time))

#Filter by desired dates
data$Full_date <- strptime(data$Full_date,format="%d/%m/%Y %H:%M:%S")
data <- subset(data,Full_date >= "2007-02-01 00:00:00" & Full_date <= "2007-02-02 23:59:59")

#Remove "?" on Global_active_power field
data <- subset(data,Global_active_power != "?")

#Convert to numeric all the required fields
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

#Set space
png(file ="plot4.png",width = 480,height = 480)
par(mfrow = c(2,2))

#Create chart 1
with(data,plot(Full_date,Global_active_power,type = "l",ylab = "Global Active Power",xlab = ""))

#Create chart 2
with(data,plot(Full_date,Voltage,type = "l",ylab = "Voltage",xlab = "datetime"))

#Create chart 3
with(data,plot(Full_date,Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = ""))
with(data,lines(Full_date,Sub_metering_2,col="red"))
with(data,lines(Full_date,Sub_metering_3,col="blue"))
legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

#Create chart 4
with(data,plot(Full_date,Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "datetime"))

dev.off()
