# Read the data.
all_power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Convert Date field into appropriate format
all_power_data$Date <- as.Date(all_power_data$Date, format="%d/%m/%Y")
#subset to retain entries from 2007/02/01 to 2007/02/02
data_for_plot <- subset(all_power_data, Date == as.Date("2007/02/01") | Date == as.Date("2007/02/02"))
#combine the Date and Time fields into a single field in the appropriate format
data_for_plot$DateTime <- with(data_for_plot, strptime(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

#Open png and plot
png("plot3.png", width = 480, height=480)
with(data_for_plot, plot(y=Sub_metering_1, x= DateTime, type="n", ylab="Energy sub metering", xlab=""))
with(data_for_plot, lines(y=Sub_metering_1, x= DateTime))
with(data_for_plot, lines(y=Sub_metering_2, x= DateTime, col="red"))
with(data_for_plot, lines(y=Sub_metering_3, x= DateTime, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd = c(1,1,1), col=c("black", "red", "blue"))
dev.off()