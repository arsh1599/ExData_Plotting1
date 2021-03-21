df <- read.table("household_power_consumption.txt",sep=";", colClasses = c('character','character',
                                                                            'numeric','numeric','numeric',
                                                                           'numeric','numeric','numeric',
                                                                           'numeric'),na.strings = "?",header = TRUE)

df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- subset(df,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

df <- df[complete.cases(df),] 

mix <- paste(df$Date,df$Time)
df$Time <- strptime(mix,"%Y-%m-%d %H:%M:%S")
df$Time <- as.POSIXct(df$Time)

with(df, {
        plot(Sub_metering_1~Time, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Time,col='Red')
        lines(Sub_metering_3~Time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()