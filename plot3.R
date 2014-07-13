#
# plot3.R
#

source("readData.R")

data <- read.data()
# names(data)

# set locale, in linux system, to produce English abbreviations
# for the days on the horizontal axis
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8")

png("plot3.png")  # defeault width, height = 480

with( data, {
      plot(DateTime, pmax( Sub_metering_1, Sub_metering_2, Sub_metering_3)
             , type="n"
             , ylab="Energy sub metering"
             , xlab=""
      )
      lines(DateTime, Sub_metering_1, col="black")
      lines(DateTime, Sub_metering_2, col="red")
      lines(DateTime, Sub_metering_3, col="blue")
      legend("topright"
             , lty=1
             , lwd=1
             , col=c("black", "red", "blue")
             , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
             )
})

dev.off()