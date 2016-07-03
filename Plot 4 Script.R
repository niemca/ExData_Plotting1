## Warning: You should save the dataset on your current working directory 
## before running this script

## Imports Household Power Consumption database into R

file_location <- paste(getwd(), "/", "household_power_consumption.txt", sep = "")
ECP <- read.table(file_location, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

## Selects only the relevant dates

ECP2 <- subset(ECP, Date == "1/2/2007" | Date == "2/2/2007")

## Sets up the graph parameterse and creates the first graph with the required format

par(mfrow = c(2, 2), mar = c(4, 4, 4, 4))
with(ECP2, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "l", ylab = "Global active power", xlab = "", cex.axis = 0.75, cex.lab = 0.75))

## Creates the second graph with the required format

with(ECP2, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Voltage, type = "l", ylab = "Voltage", xlab = "datetime", cex.axis = 0.75, cex.lab = 0.75))

## Creates the third graph with the required format

with(ECP2, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", cex.axis = 0.75, cex.lab = 0.75))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty = "solid", cex = 0.75, col = c("black", "red", "blue"), xjust = 1, y.intersp = 0.75)
with(ECP2, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red"))
with(ECP2, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue"))

## Creates the fourth graph with the required format

with(ECP2, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", cex.axis = 0.75, cex.lab = 0.75))

## Copies the graph into a png file and closes the graph device

dev.copy(png, file = "plot4.png")
dev.off()