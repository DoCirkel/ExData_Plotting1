
library(readr)


household_pc <- read_delim("Courses/Coursera/Opdrachten/4.Exploratory/household_power_consumption.txt", 
                           ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                        Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)
#NB: automatically changes '?' to NA


#Subsetting data
household <- subset(household, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


############# Plot 1
# Make plot 1
hist(household$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

############ Plot 3
# Make plot 3
plot(household$DateTime, household$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="") 
lines(household$DateTime, household$Sub_metering_2, col = "red")
lines(household$DateTime, household$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save plot 3
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
