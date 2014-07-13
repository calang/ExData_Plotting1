#
# plot4.R
#

source("readData.R")

data <- read.data()
# names(data)

# set locale, in linux system, to produce English abbreviations
# for the days on the horizontal axis
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8")

png("plot4.png")  # defeault width, height = 480

# adjust plot grid and plot text size
par(mfcol=c(2,2), cex=0.7)

# top left plot
# reproduce plot 2
with( data,
      plot(DateTime, Global_active_power
           , type="l"
           , ylab="Global Active Power"
           , xlab=""
      )
)

# bottom left plot
# reproduce plot 3
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
         , bty="n"
         , cex=1.2
  )
})

# top right plot
with( data,
      plot(DateTime, Voltage
           , type="l"
           , xlab="datetime"
      )
)

# bottom right plot
with( data, {
  plot(DateTime, Global_reactive_power
       , type="l"
       , xlab="datetime"
  )
})

dev.off()