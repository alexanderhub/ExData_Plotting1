# Include helper file which loads data and defines a function to read only a necessary subset into a table
source('loadData.R')
data <- loadData()

# open device
png(filename='plot3.png', width=480, height=480, units='px')

# plot data
startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))
plot(data$Time,
     data$Sub_metering_1,
     xlim=c(startDay, endDay),
     xaxt="n",
     type="l",
     xlab="",
     ylab="Energy sub metering"
)

lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")

axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

legend("topright", 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty=c(1, 1, 1))

# Turn off device
dev.off()