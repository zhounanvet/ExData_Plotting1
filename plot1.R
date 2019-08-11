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

png("plot1.png")
hist(data1$Global_active_power, ylim=c(0,1200), col='red', xlab='Global Active Power (kilowatt)',main='Global Active Power')
dev.off()

