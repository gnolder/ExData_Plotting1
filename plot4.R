##Produces plot4.png Exploratory Data Analysis Course 012 Project 1

#Read all of the data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

#Pull out the specific dates required
data<-data[data$Date %in% c('1/2/2007', '2/2/2007'),]

#Create a field with character string of both data and time
data$DateTime<-paste(data$Date,", ",data$Time)

#Convert to date and time format
data$DateTime<-strptime(data$DateTime, format="%d/%m/%Y ,  %H:%M:%S")

#Create plot4.png
png(filename="plot4.png",width = 480, height = 480, units = "px")
  #Set up 2 by 2 plots in a single file
  par(mfrow = c(2,2))
  #Create Global_active_power plot
  plot(data$DateTime,data$Global_active_power,xlab="", ylab="Global Active Power", type="l")
  #Create Voltage plot
  plot(data$DateTime, data$Voltage, type="l",xlab="datetime", ylab="Voltage")
  #Create Sub_metering plot with multiple lines and legend
  plot(data$DateTime, data$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering")
  lines(data$DateTime,data$Sub_metering_1, col="black")
  lines(data$DateTime,data$Sub_metering_2, col="red")
  lines(data$DateTime,data$Sub_metering_3, col="blue")
  legend("topright",col=c("black","red","blue"), cex=.90,  bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))
  #Create Global_reactive_power plot
  plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
