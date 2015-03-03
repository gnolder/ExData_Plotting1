##Produces plot1.png Exploratory Data Analysis Course 012 Project 1

#Read all of the data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

#Pull out the specific dates required
data<-data[data$Date %in% c('1/2/2007', '2/2/2007'),]

#Create a field with character string of both data and time
data$DateTime<-paste(data$Date,", ",data$Time)

#Convert to date and time format
data$DateTime<-strptime(data$DateTime, format="%d/%m/%Y ,  %H:%M:%S")

#Create plot1.png
png(filename="plot1.png",width = 480, height = 480, units = "px")
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)",col="red", main="Global Active Power")
dev.off()
