data <- read.csv("household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png(filename="plot1.png",width=480,height=480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowats)", col="red")
dev.off()
