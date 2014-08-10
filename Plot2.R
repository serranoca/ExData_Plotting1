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
png(filename = "plot2.png", width = 480, height = 480)
plot(b$DateTime, b$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()