##
## plot4.R
##
##  Multi-plots for the period 1st February 2007 to 2nd February 2007 inclusive.
##
##  a) Global Active Power by time
##  b) Voltage by time
##  c) Energy Sub metering by time
##  d) Global Reactive Power by time
##

##
## Read the Household Power Consumption dataset into a data frame.
##

datFile <- "household_power_consumption.txt"
datPower <- read.csv(datFile, header = TRUE, sep = ";", na.strings = "?")

##
## Clean up the data:
##
## (a) Turn the Date character string into a Date variable
##

datPower$Date <- as.Date(datPower$Date, "%d/%m/%Y")

##
## (b) Turn the Time character string into a Date/Time variable incorporating
##      the date associated with the observation.
##

datPower$Time <- strptime(paste(datPower$Date, datPower$Time), "%Y-%m-%d %H:%M:%S" , tz ="")

##
## Establish the Date range for plotting results
##

datRange <- as.Date(c("2007-02-01","2007-02-02"))

##
## Create the plot and output the results to a file.
##

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(datPower[datPower$Date %in% datRange,], {
  
  ##  a) Global Active Power by time
 
  plot(Time, Global_active_power,  type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

  ##  b) Voltage by time
  
  plot(Time, Voltage,  type = "l", ylab = "Voltage" , xlab = "datetime")

  ##  c) Energy Sub metering by time
  
  plot(Time, Sub_metering_1,  type = "l", ylab = "Energy sub metering", xlab = "",col = "black")
  lines(Time, Sub_metering_2,  type = "l", col = "red")
  lines(Time, Sub_metering_3,  type = "l", col = "blue")
  legend("topright", col = c("black", "red", "blue") , lty = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

  ##  d) Global Reactive Power by time
  
  plot(Time, Global_reactive_power,  type = "l", ylab = "Global_reactive_power" , xlab = "datetime")
})


dev.off()

##
## End
##


