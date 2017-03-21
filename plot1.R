plot1 <- function() {
  ## read the file in
  read.delim("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE) -> hpc
  ## extract only the data related to the 2 dates and replace within the vector
  subset(hpc,Date %in% c("1/2/2007","2/2/2007")) -> hpc
  ## convert the date column to correct format
  as.Date(hpc$Date,format="%d/%m/%Y") ->hpc$Date
  ## initiate a png write
  png("plot1.png", width=480, height=480)
  ## plot the histogram
  hist(hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
  ## close the png device
  dev.off()
}