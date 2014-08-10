# Set working directory to directory location were the file "household_power_consumption.txt" is located
# Read data into data.frame "a"
# Change Vraiable Date to an R variable class "date"
# Subset to dates of interest >= '2007-02-01' & <= '2007-02-02'
a <- read.table("household_power_consumption.txt", sep=";",  header=TRUE, na.strings = "?");
a$Date <- as.Date(a$Date, format="%d/%m/%Y");
b <- subset(a, Date >= '2007-02-01' & Date <= '2007-02-02');
b$DateTime <- strptime(paste(b$Date, b$Time), format="%Y-%m-%d %H:%M:%S");

# Create PNG plot according to homework requirements
png(filename = "plot1.png", width = 480, height = 480);
hist(b$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power");
dev.off()