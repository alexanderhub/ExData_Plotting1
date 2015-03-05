# Include helper file which loads data and defines a function to read only a necessary subset into a table
source('loadData.R')
data <- loadData()

# open device
png(filename='plot1.png', width=480, height=480, units='px')

# plot data
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

# Turn off device
dev.off()