data <- read.csv("household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png",width=480,height=480)
with(data, plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering"))
with(data, lines(DateTime,Sub_metering_2,col="red"))
with(data, lines(DateTime,Sub_metering_3,col="blue"))
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
