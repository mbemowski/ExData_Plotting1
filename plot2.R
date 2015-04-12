data <- read.csv("household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",width=480,height=480)
with(data, plot(DateTime,Global_active_power,type="l",ylab="Global Active Power(kilowats)"))
dev.off()
