data <- read.csv("household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png",width=480,height=480)

plot.new()
par(mfrow=c(2,2))
with(data, plot(DateTime,Global_active_power,type="l",ylab="Global Active Power(kilowats)",xlab=""))
with(data, plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime"))
with(data, plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(data, lines(DateTime,Sub_metering_2,col="red"))
with(data, lines(DateTime,Sub_metering_3,col="blue"))
with(data, legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))
with(data, plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))

dev.off()
