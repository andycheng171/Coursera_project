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

# Draw the plot2

plot(data_sub$Global_active_power~data_sub$Datetime,type="l",ylab="Global Active Power (kilowatts)", xlab="")

# Export the plot to PNG format

dev.copy(png,file="plot2.png")
dev.off()
