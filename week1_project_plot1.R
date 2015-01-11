

#setwd("C:/Users/jonckhep/Documents/04. Learning & Development/03. Trainings/2014_DataScientist/04_exploratory_data_analysis")

#load data
consumption <- read.csv("./data/household_power_consumption.txt", sep=';', na.string="?")

consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")

#subsetting to relevant dates
data <- subset(consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


#plot
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


#save bitmap
dev.copy(png, file = "week1_project_plot1.png")
dev.off()