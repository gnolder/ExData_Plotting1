##Produces plot3.png Exploratory Data Analysis Course 012 Project 1

#Read all of the data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

#Pull out the specific dates required
data<-data[data$Date %in% c('1/2/2007', '2/2/2007'),]

#Create a field with character string of both data and time
data$DateTime<-paste(data$Date,", ",data$Time)

#Convert to date and time format
data$DateTime<-strptime(data$DateTime, format="%d/%m/%Y ,  %H:%M:%S")

#Create plot3.png
png(filename="plot3.png",width = 480, height = 480, units = "px")
  #Set up chart framework
  plot(data$DateTime, data$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering")
  #Plot each line
  lines(data$DateTime,data$Sub_metering_1, col="black")
  lines(data$DateTime,data$Sub_metering_2, col="red")
  lines(data$DateTime,data$Sub_metering_3, col="blue")
  #Create the legend
  legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))
dev.off()
