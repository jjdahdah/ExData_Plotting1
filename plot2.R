#Read the dataset
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)

#Create new date/time field
data$Full_date <- paste(as.character(data$Date),as.character(data$Time))

#Filter by desired dates
data$Full_date <- strptime(data$Full_date,format="%d/%m/%Y %H:%M:%S")
data <- subset(data,Full_date >= "2007-02-01 00:00:00" & Full_date <= "2007-02-02 23:59:59")

#Remove "?" on Global_active_power field
data <- subset(data,Global_active_power != "?")

#Convert to numeric Global_active_power field
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Create final plot
png(file ="plot2.png",width = 480,height = 480)
with(data,plot(Full_date,y=Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = ""))
dev.off()
