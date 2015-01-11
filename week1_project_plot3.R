

#setwd("C:/Users/jonckhep/Documents/04. Learning & Development/03. Trainings/2014_DataScientist/04_exploratory_data_analysis")

#load data
consumption <- read.csv("./data/household_power_consumption.txt", sep=';', na.string="?")

consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")

#subsetting to relevant dates
data <- subset(consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#plot
with(data, {
  plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~Datetime, col='Red')
  lines(Sub_metering_3~Datetime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#save bitmap
dev.copy(png, file = "week1_project_plot3.png")
dev.off()