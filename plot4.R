
library(readr)


household_pc <- read_delim("Courses/Coursera/Opdrachten/4.Exploratory/household_power_consumption.txt", 
                           ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                        Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)
#NB: automatically changes '?' to NA


#Subsetting data
household <- subset(household, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


############ Plot 4
# Make plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(household$DateTime, household$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
plot(household$DateTime, household$Voltage, type="l",
     ylab="Voltage", xlab="datetime")
plot(household$DateTime, household$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="") 
lines(household$DateTime, household$Sub_metering_2, col = "red")
lines(household$DateTime, household$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(household$DateTime, household$Global_reactive_power, type="l",
     ylab = "Global_reactive_power", xlab="datetime")

# Save plot 4
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


