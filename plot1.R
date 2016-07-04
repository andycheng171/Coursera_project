# Subset the data by date 

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_sub<- subset(data, subset=(data$Date>="2007-02-01" & data$Date<="2007-02-02"))
rm(data)

# Draw the plot 1

data_sub$Global_active_power<-as.numeric(data_sub$Global_active_power)

hist(data_sub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red",col.bg="White")

# Export the plot to PNG format

dev.copy(png,file="plot1.png")
dev.off()
