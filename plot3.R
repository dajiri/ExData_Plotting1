#PLOT3
# Set working directory, for me, setwd("C:/R Programming/exploratory") 
# and read data in to R defining txt file properties
txt <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", colClasses=c(rep("character",2), rep("numeric",7)),
                  na="?")
# Select data required two days and save as a data frame.
subset_txt <- txt[txt$Date %in% c("1/2/2007", "2/2/2007"), ]
# Remove full txt 
rm(txt)
# Converting date and time formats
subset_txt$Date <- as.Date(subset_txt$Date, "%d/%m/%Y")
# paste a new column named date_time
date_time <- paste(as.character(subset_txt$Date), subset_txt$Time)
# Defining Date_Time column as.POSIXct
subset_txt$Date_Time <- as.POSIXct(date_time)
class(subset_txt$Date_Time)
#[1] "POSIXct" "POSIXt" 

# #plotting $Date_Time vs $Sub_metering_1 with the required parameters
png("plot3.png", width = 480, height = 480)

plot(subset_txt$Date_Time, subset_txt$Sub_metering_1, type = "l", col = 'black', xlab = "", 
     ylab = "Energy sub metering")

lines(subset_txt$Date_Time, subset_txt$Sub_metering_2, col = 'red')
lines(subset_txt$Date_Time, subset_txt$Sub_metering_3, col = 'blue')

legend("topright", col = c("black", "red", "blue"),
       c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "), lwd = 1)

dev.off()