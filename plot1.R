#Read the dataset
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#Filter by desired dates
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- subset(data,Date == "2007-02-01" | Date == "2007-02-02")

#Remove "?" on Global_active_power field
data <- subset(data,Global_active_power != "?")

#Convert to numeric Global_active_power field
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Create final histogram
png(file ="plot1.png",width = 480,height = 480)
hist(data$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main = "Global Active Power")
dev.off()
