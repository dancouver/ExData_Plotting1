plot4 <- function() {
  ## read the file in
  read.delim("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE) -> hpc
  ## extract only the data related to the 2 dates and replace within the vector
  subset(hpc,Date %in% c("1/2/2007","2/2/2007")) -> hpc
  
  ## convert the date and time columns to correct format
  as.Date(hpc$Date,format="%d/%m/%Y") ->hpc$Date
  paste(as.Date(hpc$Date), hpc$Time) -> fulldate
  as.POSIXct(fulldate) -> hpc$Datetime
  
  ## initiate a png write
  png("plot4.png", width=480, height=480)
  
  ## set the multiple chart positioning parameters
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  
  ## plot the 4 charts
  with(hpc, {
    ## from plot2
    plot(Global_active_power~Datetime, type="l",xlab="",
         ylab="Global Active Power (kilowatts)")
    ## new
    plot(Voltage~Datetime, type="l",xlab="", 
         ylab="Voltage (volt)")
    ## from plot 3
    plot(Sub_metering_1~Datetime, type="l",xlab="",
    ylab="Global Active Power (kilowatts)")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
      ## add the required legend to the top right
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    ## new
    plot(Global_reactive_power~Datetime, type="l",xlab="",
         ylab="Global Rective Power (kilowatts)")
    })  

  ## close the png device
  dev.off()
}