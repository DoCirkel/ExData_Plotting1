
library(readr)


household_pc <- read_delim("Courses/Coursera/Opdrachten/4.Exploratory/household_power_consumption.txt", 
                           ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                        Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)
#NB: automatically changes '?' to NA


#Subsetting data
household <- subset(household, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

############ Plot 2
# Extra column needed
household$DateTime <- as.POSIXct(paste(as.Date(household$Date), household$Time))

# System needs to be set to English, in order to get English weekdays
Sys.setlocale("LC_TIME","English")

# Make plot 2
plot(household$DateTime, household$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Save plot 2
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


