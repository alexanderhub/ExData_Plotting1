# Include helper file which loads data and defines a function to read only a necessary subset into a table
source('loadData.R')
data <- loadData()

# open device
png(filename='plot2.png', width=480, height=480, units='px')

# plot data
startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))
plot(data$Time,
     data$Global_active_power,
     xlim=c(startDay, endDay),
     xaxt="n",
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
)
axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

# Turn off device
dev.off()