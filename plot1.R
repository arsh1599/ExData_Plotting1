df <- read.table("household_power_consumption.txt",sep=";", colClasses = c('character','character',
                                                                            'numeric','numeric','numeric',
                                                                           'numeric','numeric','numeric',
                                                                           'numeric'),na.strings = "?",header = TRUE)

df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- subset(df,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

df <- df[complete.cases(df),] 

mix <- paste(df$Date,df$Time)
df$Time <- strptime(mix,"%Y-%m-%d %H:%M:%S")

hist(df$Global_active_power, main="Golbal Active Power", xlab = "Global Active Power (kilowatts)",col = 'red')

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()