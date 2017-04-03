rm(list=ls()) #Clear all
graphics.off() #Close all


par(mfrow=c(1,2))

#North
cuantos = 100

url1 = "http://www.metoffice.gov.uk/hadobs/hadcrut4/data/current/time_series/HadCRUT.4.5.0.0.monthly_nh.txt"

temporal = read.table(url1,sep="")
tempn = ts(temporal[,2],start = c(1850,1), frequency = 12)

plot(tempn,type="l",lwd=0.5,ylab="Temperature North Hem.",xlab = "Year")

yon=acf(tempn,lag.max = cuantos,plot=F)
plot(0:cuantos,yon$acf,type="l",lwd=1,ylab="Autocorrelation Function",xlab="Lags",ylim=c(0,1))
