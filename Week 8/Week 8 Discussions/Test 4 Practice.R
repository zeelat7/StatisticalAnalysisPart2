qnorm(.975)
n1 <- 100
x1 <- 42
n2 <- 100
x2 <- 45

pHat1 <- x1/n1 
pHat2 <- x2/n2
pHat <- (x1 + x2)/(n1 + n2)
round(pHat, 4)

# Q2: Test the null hypothesis that the proportion for population 2 is greater
# than the proportion for population 1. Pick the correct z and p-value.

# H0 = pHat2 > pHat1
# H0 determines one sided test (since not set to equal)

# Determine test statistic:
zScore <- (pHat2 - pHat1)/(sqrt((pHat*(1-pHat))*((1/n1)+(1/n2))))
round(zScore, 3)
# Now look up zScore in table: 0.428 = 0.664
# Since we are doing greater than, we subtract 1, as z-score is to LEFT and we
# need to look to RIGHT. Thus: 1 - 0.664 = 0.336

u1 <- 19.4
u2<-15.1

s1<-1.4

s2<-1.3

n1=35

n2=40

UpperTail<-(u1-u2)+qnorm(.975)*sqrt((s1^2/n1)+(s2^2/n2))

LowerTail<-(u1-u2)-qnorm(.975)*sqrt((s1^2/n1)+(s2^2/n2))





x<-c(2,15,6,9,11,3,8,12)
y<-c(52,165,63,136,184,48,142,230)
fit<-lm(y~x)
summary(fit)
cor(x,y)
