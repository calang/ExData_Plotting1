#
# plot1.R
#

source("readData.R")

data <- read.data()
# names(data)

png("plot1.png")  # defeault width, height = 480

with( data
      , hist(Global_active_power
             , main="Global Active Power"
             , xlab="Global Active Power (kilowatts)"
             , col="red")
      )

dev.off()
