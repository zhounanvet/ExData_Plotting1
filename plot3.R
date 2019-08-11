## read and process data ###
data<-read.table('household_power_consumption.txt', nrow=90000,sep=';', header = TRUE, stringsAsFactors = FALSE)
str(data)
data$date<- as.Date(data$Date,'%d/%m/%Y')

index<- grep('2007-02-01',data$date)
index1<-grep('2007-02-02',data$date)

data1<- data[c(index,index1),]
head(data1)


## make plot###
datetime<- paste(data1$Date, data1$Time)
data1$date1<- strptime(datetime,'%d/%m/%Y %H:%M:%S')

data1$Sub_metering_1<- as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2<- as.numeric(data1$Sub_metering_2)

png('plot3.png')
with(data1, plot(date1,Sub_metering_1,type='n', ylab='Energy sub metering', xlab=''))
with(data1, lines(date1,Sub_metering_1,type='l'))
with(data1, lines(date1,Sub_metering_2,type='l', col='red'))
with(data1, lines(date1,Sub_metering_3,type='l', col='blue'))
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       col = c('black','red','blue'), lty=1,cex=0.8)
dev.off()
