## Warning: You should save the dataset on your current working directory 
## before running this script

## Imports Household Power Consumption database into R

file_location <- paste(getwd(), "/", "household_power_consumption.txt", sep = "")
ECP <- read.table(file_location, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

## Selects only the relevant dates

ECP2 <- subset(ECP, Date == "1/2/2007" | Date == "2/2/2007")

## Creates the graph with the required format

with(ECP2, hist(as.double(Global_active_power), breaks = 12, main = "Global active power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200), col = "red", cex.axis = 0.7, cex.lab = 0.7, cex.main = 0.9))

## Copies the graph into a png file and closes the graph device

dev.copy(png, file = "plot1.png")
dev.off()