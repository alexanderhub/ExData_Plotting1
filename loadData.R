if (!require(dplyr)) {
        install.packages(dplyr)
}
library(dplyr)

# Download and unzip data file, if it's not there
fileLocalUnzipped <- "household_power_consumption.txt"
if (!file.exists(fileLocalUnzipped)) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        fileLocal <- "household_power_consumption.zip"
        print("Downloading file...")
        download.file(fileUrl, destfile=fileLocal, method="curl")
        unzip(fileLocal)
}
# Load data from the dates 2007-02-01 and 2007-02-02
loadData <- function() {
        read.table(fileLocalUnzipped, sep=';', header=TRUE, na.strings='?', colClasses=c(rep('character',2),rep('numeric',7)) ) %>%
                mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
                mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
                filter(Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00')) %>%
                tbl_df
}

