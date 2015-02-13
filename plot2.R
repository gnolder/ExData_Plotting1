##Produces plot2.png Exploratory Data Analysis Course Project 1

#Read all of the data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

#Pull out the specific dates required
data<-data[data$Date %in% c('1/2/2007', '2/2/2007'),]

#Create a field with character string of both data and time
data$DateTime<-paste(data$Date,", ",data$Time)

#Convert to date and time format
data$DateTime<-strptime(data$DateTime, format="%d/%m/%Y ,  %H:%M:%S")

#Create plot2.png
png(filename="plot2.png",width = 480, height = 480, units = "px")
plot(data$DateTime,data$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()
