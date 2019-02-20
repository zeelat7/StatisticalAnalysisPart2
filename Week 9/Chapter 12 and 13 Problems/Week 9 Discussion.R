#12.60
x<- c(1,2,3,4,5,6,7,8,9,10)
y<- c(66.49, 67.83, 69.11, 70.37, 71.66, 73.01, 74.55, 76.04, 77.61, 78.62)

fit<-lm(y~x)
summary(fit)
cor(x,y)

1.37073*13 + 64.99

res<- resid(fit)
par(mfrow=c(1,2))
plot(res, main = "Bangladesh Labor Force", ylab = "Residuals", xlab = "Labor Force Year", col = "salmon")
qqnorm(res, col = "deepskyblue") # A quantile normal plot - good for checking normality
qqline(res)

