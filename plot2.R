#
# plot2.R
#

source("readData.R")

data <- read.data()
# names(data)

# set locale, in linux system, to produce English abbreviations
# for the days on the horizontal axis
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8")

png("plot2.png")  # defeault width, height = 480

with( data,
      plot(DateTime, Global_active_power
           , type="l"
           , ylab="Global Active Power (kilowatts)"
           , xlab=""
           )
      )

dev.off()
