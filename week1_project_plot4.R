

#setwd("C:/Users/jonckhep/Documents/04. Learning & Development/03. Trainings/2014_DataScientist/04_exploratory_data_analysis")

#load data
consumption <- read.csv("./data/household_power_consumption.txt", sep=';', na.string="?")

consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")

#subsetting to relevant dates
data <- subset(consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#screen settings
par(mfrow = c(2,2))

#plot
with(data, {
  plot(Global_active_power~Datetime, type = "l", ylab = "Global Active Power", xlab = "")
  plot(Voltage~Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~Datetime, col='Red')
  lines(Sub_metering_3~Datetime, col='Blue')
  plot(Global_reactive_power~Datetime, type = "l", ylab = "Global reactive power", xlab = "datetime")
  
  #plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  #lines(Sub_metering_2~Datetime, col='Red')
  #lines(Sub_metering_3~Datetime, col='Blue')
})


#save bitmap
dev.copy(png, file = "week1_project_plot4.png")
dev.off()