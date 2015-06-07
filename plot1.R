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

png("plot1.png")
hist(sample$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
