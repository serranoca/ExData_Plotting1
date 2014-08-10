# Set working directory to directory location were the file "household_power_consumption.txt" is located
# Read data into data.frame "a"
# Change Vraiable Date to an R variable class "date"
# Subset to dates of interest >= '2007-02-01' & <= '2007-02-02'
#
# No need to read table if data.frame b is available in main memory
a <- read.table("household_power_consumption.txt", sep=";",  header=TRUE, na.strings = "?");
a$Date <- as.Date(a$Date, format="%d/%m/%Y");
b <- subset(a, Date >= '2007-02-01' & Date <= '2007-02-02');
b$DateTime <- strptime(paste(b$Date, b$Time), format="%Y-%m-%d %H:%M:%S")
dim(a); dim(b); names(b)

# Create PNG plot according to homework requirements
png(filename = "plot4.png", width = 480, height = 480);
par(mfcol=c(2,2));
plot(b$DateTime, b$Global_active_power, type="l", ylab="Global Active Power", xlab="");
plot(b$DateTime, b$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="");
lines(b$DateTime, b$Sub_metering_1, col="black");
lines(b$DateTime, b$Sub_metering_2, col="red");
lines(b$DateTime, b$Sub_metering_3, col="blue");
legend('topright', lwd=c(3,3,3), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.5);
plot(b$DateTime, b$Voltage, type="l", ylab="Voltage", xlab="Datetime");
plot(b$DateTime, b$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="Datetime");
dev.off()