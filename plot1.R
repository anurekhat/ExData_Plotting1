# Read the data.
all_power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Convert Date field into appropriate format
all_power_data$Date <- as.Date(all_power_data$Date, format="%d/%m/%Y")
#subset to retain entries from 2007/02/01 to 2007/02/02
data_for_plot <- subset(all_power_data, Date == as.Date("2007/02/01") | Date == as.Date("2007/02/02"))
#combine the Date and Time fields into a single field in the appropriate format
data_for_plot$DateTime <- with(data_for_plot, strptime(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

#Open png and plot
png("plot1.png", width = 480, height=480)
with(data_for_plot, hist(Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", ylab="Frequency",
                         main="Global Active Power"))
dev.off()
