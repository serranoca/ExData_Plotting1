# Set working directory to directory location were the file "household_power_consumption.txt" is located
# Read data into data.frame "a"
# Change Vraiable Date to an R variable class "date"
# Subset to dates of interest >= '2007-02-01' & <= '2007-02-02'
a <- read.table("household_power_consumption.txt", sep=";",  header=TRUE, na.strings = "?");
a$Date <- as.Date(a$Date, format="%d/%m/%Y");
b <- subset(a, Date >= '2007-02-01' & Date <= '2007-02-02');
b$DateTime <- strptime(paste(b$Date, b$Time), format="%Y-%m-%d %H:%M:%S")
dim(a); dim(b); names(b)

# Create PNG plot according to homework requirements
png(filename = "plot3.png", width = 480, height = 480)
plot(b$DateTime, b$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="");
lines(b$DateTime, b$Sub_metering_1, col="black");
lines(b$DateTime, b$Sub_metering_2, col="red");
lines(b$DateTime, b$Sub_metering_3, col="blue");
legend('topright', lwd=c(1, 1.5, 2), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()