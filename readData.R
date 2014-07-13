#
# readData.R
#
# read data from file into memory, for the production of the plots

source("convDate.R")

read.data <- function() {
  data <- 
    read.csv("household_powerc_subset.txt"
             , as.is=T
             , sep=";"
             , colClasses=c(
               "character" # Date: Date in format dd/mm/yyyy
               , "character" # Time: time in format hh:mm:ss
               , "numeric" # Global_active_power: household global minute-averaged active power (in kilowatt)
               , "numeric" # Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
               , "numeric" # Voltage: minute-averaged voltage (in volt)
               , "numeric" # Global_intensity: household global minute-averaged current intensity (in ampere)
               , "numeric" # Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
               , "numeric" # Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
               , "numeric" # Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
             )
             , na.strings="?"
    )
  
  n <- ncol(data)
  data[,n+1] <- NA
  names(data)[n+1] <- "DateTime"
  rm(n)
  
  data$DateTime <- single.time( data$Date, data$Time)

  return(data)
}
