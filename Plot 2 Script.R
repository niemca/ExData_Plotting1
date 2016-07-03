## Warning: You should save the dataset on your current working directory 
## before running this script

## Imports Household Power Consumption database into R

file_location <- paste(getwd(), "/", "household_power_consumption.txt", sep = "")
ECP <- read.table(file_location, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

## Selects only the relevant dates

ECP2 <- subset(ECP, Date == "1/2/2007" | Date == "2/2/2007")

## Creates the graph with the required format

with(ECP2, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "", cex.axis = 0.75, cex.lab = 0.75))

## Copies the graph into a png file and closes the graph device

dev.copy(png, file = "plot2.png")
dev.off()
