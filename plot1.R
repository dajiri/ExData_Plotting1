#PLOT1
# Set working directory, for me, setwd("C:/R Programming/exploratory") 
# and read data in to R defining txt file properties
txt <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", colClasses=c(rep("character",2), rep("numeric",7)),
                  na="?")
# Select data required two days and save as a data frame.
subset_txt <- txt[txt$Date %in% c("1/2/2007", "2/2/2007"), ]
#remove full txt 
rm(txt)
# Converting date and time formats
subset_txt$Date <- as.Date(subset_txt$Date, "%d/%m/%Y")
# paste a new column named date_time
date_time <- paste(as.character(subset_txt$Date), subset_txt$Time)
# Defining Date_Time column as.POSIXct
subset_txt$Date_Time <- as.POSIXct(date_time)
class(subset_txt$Date_Time)
#[1] "POSIXct" "POSIXt"  

# The data in 'subset_txt' will be used for all 4 plots
#plotting histogram with the required parameters
png("plot1.png", width=480, height=480)
hist(subset_txt$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()




