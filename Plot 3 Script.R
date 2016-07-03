## Warning: You should save the dataset on your current working directory 
## before running this script

## Imports Household Power Consumption database into R

file_location <- paste(getwd(), "/", "household_power_consumption.txt", sep = "")
ECP <- read.table(file_location, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

## Selects only the relevant dates

ECP2 <- subset(ECP, Date == "1/2/2007" | Date == "2/2/2007")

## Creates the graph with the required format

with(ECP2, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", cex.axis = 0.75, cex.lab = 0.75))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid", cex = 0.75, col = c("black", "red", "blue"), xjust = 1, y.intersp = 0.75)
with(ECP2, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red"))
with(ECP2, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue"))

## Copies the graph into a png file and closes the graph device

dev.copy(png, file = "plot3.png")
dev.off()