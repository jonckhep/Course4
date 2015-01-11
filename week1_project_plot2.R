

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
plot(data$Global_active_power ~ data$Datetime, type ="l", ylab = "Global Active Power (kilowatts)", xlab="")


#save bitmap
dev.copy(png, file = "week1_project_plot2.png")
dev.off()