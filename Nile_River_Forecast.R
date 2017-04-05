rm(list=ls()) #Clear all
graphics.off() #Close all

library(longmemo)
library(forecast)

cuantos = 184
ini = 350

data(NileMin)
t = length(NileMin)
testNile = NileMin[1:(t-cuantos)]



fitLM <- forecast::arfima(testNile)
fitSM <- auto.arima(testNile,d=0)

fechas = seq(622,1284)
Nile = NileMin[(ini+1):t]
fec_re = fechas[(ini+1):t]

plot(fec_re,Nile,type='l',lwd=0.7,ylab="Nile River Minima",xlab="Year")
xx = fec_re[(t-cuantos+1-ini):(t-ini)]

xlm = forecast.fracdiff(fitLM,h=cuantos,level=c(80,95))
lines(xx,xlm$mean,lty=2,lwd=1.5)
lines(xx,xlm$upper[,2],lty=2,lwd=1.3)
lines(xx,xlm$lower[,2],lty=2,lwd=1.3)


xsm = forecast.Arima(fitSM,h=cuantos,level=c(80,95))
lines(xx,xsm$mean,lty=3,lwd=1.5)
lines(xx,xsm$upper[,2],lty=3,lwd=1.3)
lines(xx,xsm$lower[,2],lty=3,lwd=1.3)

legend("topleft",c("Realizations","Long Memory and 95% CI","Short Memory and 95% CI"),lty=c(1,2,3),cex=0.7)


