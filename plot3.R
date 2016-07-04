# Preparing the data file
# (Please note that you have to change the file path below to your own local path)

data<-read.table("/Users/andycheng/Desktop/household_power_consumption.txt",header=T,sep=";")

# Subset the data by date 

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_sub<- subset(data, subset=(data$Date>="2007-02-01" & data$Date<="2007-02-02"))
rm(data)

# Converting dates
datetime<-paste(as.Date(data_sub$Date),data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

data_sub$Test<- as.POSIXct(datetime)

# Draw the plot3

data_sub$Sub_metering_1<-as.numeric(data_sub$Sub_metering_1)
data_sub$Sub_metering_2<-as.numeric(data_sub$Sub_metering_2)
data_sub$Sub_metering_3<-as.numeric(data_sub$Sub_metering_3)


with(data_sub, {
        plot(Sub_metering_1~Datetime, type="l", xlab="",ylab="Global Active Power (kilowatts)")
        lines(Sub_metering_2~Datetime, col="red")
        lines(Sub_metering_3~Datetime, col="blue")
})

legend("topright",col=c("black","red","blue"),lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Export the plot to PNG format

dev.copy(png,file="plot3.png")
dev.off()

