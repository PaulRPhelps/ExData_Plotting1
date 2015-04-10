##
## plot3.R
##
##  Line Graphs for each of the three Energy Sub Metering measurement sets
##  by time for the period 1st February 2007 to 2nd February 2007 inclusive.
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


png(file = "plot3.png", width = 480, height = 480)

with(datPower[datPower$Date %in% datRange,], {

  plot(Time, Sub_metering_1,  type = "l", ylab = "Energy sub metering", xlab = "",col = "black")
  lines(Time, Sub_metering_2,  type = "l", col = "red")
  lines(Time, Sub_metering_3,  type = "l", col = "blue")
  legend("topright", col = c("black", "red", "blue") , lty = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
         
  })

dev.off()

##
## End
##