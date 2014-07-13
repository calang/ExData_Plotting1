#
# convDate.R
#
# provide function to convert date-time columns into a single date.time vector

single.time <- function( xdate, xtime) {
  
  # convert date input to date.time
  date <-
    as.POSIXlt(
      xdate
      , format="%d/%m/%Y"
    )

  # convert time input to date.time
  time <-
    as.POSIXlt(
      xtime
      , format="%H:%M:%S"
    )
  
  # combine ("add") both date.times
  date$hour <- time$hour
  date$min <- time$min
  date$sec <- time$sec
  
  return(date)  
}
