## read and process data ###
data<-read.table('household_power_consumption.txt', nrow=90000,sep=';', header = TRUE, stringsAsFactors = FALSE)
str(data)
data$date<- as.Date(data$Date,'%d/%m/%Y')

index<- grep('2007-02-01',data$date)
index1<-grep('2007-02-02',data$date)

data1<- data[c(index,index1),]
head(data1)


## make plot###
data1$Global_active_power<- as.numeric(data1$Global_active_power)

data1$wkday<-weekdays(data1$date, abbreviate = TRUE)

datetime<- paste(data1$Date, data1$Time)
data1$date1<- strptime(datetime,'%d/%m/%Y %H:%M:%S')

png('plot2.png')
with(data1, plot(date1, Global_active_power, type = "l", ylab='Global Active Power (kilowatt)', xlab=''))
dev.off()

