# This program is part of Exploratory Data Analysis course from John Hopkins University
#
# Author: Rafael Tartalia (rafael.tartalia@gmail.com)
#
# This program subset all dataset provided and generate a histogram.
# 
# If you cannot read the entire dataset, I suggest that you cut the dataset using GNU utilities on 
# a POSIX command line interface, like that:
# 
# > cat data/household_power_consumption.txt | grep "^1/2/2007\|^2/2/2007" >> new_subset.txt
#
# Or apply the same technique using R functions.


# read the entire dataset
dsClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
ds <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = dsClasses, na.strings = "?")

# subset dataset by date
sample <- ds[ds$Date == "1/2/2007" | ds$Date == "2/2/2007", ]
sample$DateTime <- paste(sample$Date, sample$Time, sep = " ")
sample$DateTime <- as.POSIXlt(sample$DateTime, format="%d/%m/%Y %H:%M:%S")

png("plot3.png")
plot(sample$DateTime, sample$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
points(sample$DateTime, sample$Sub_metering_2, type = "l", col="red")
points(sample$DateTime, sample$Sub_metering_3, type = "l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()
