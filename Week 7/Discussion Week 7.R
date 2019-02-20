#10.60

n1 <- 25
x1 <- 38.4
sig1 <- 9.8

n2 <- 35
x2 <- 23.1
sig2 <- 7.4

alpha <- 0.01

z <- round(qnorm(1 - alpha/2), 3)

pe <- (x1-x2)

sqrtval <- sqrt((sig1/n1) + (sig2/n2))

val1 <- pe-z*sqrtval
val2 <- pe+z*sqrtval

val1
val2

#data supports the theory that population with fertilizer grew larger

#10.56------------------------
n1 <- 400
p1 <- 220/400

n2 <- 450
p2 <- 216/450

alpha <- 0.01

pbar <- (n1*p1+n2*p2)/(n1+n2)
qbar <- 1-pbar

critZ <- round(qnorm(1 - alpha/2), 3)

observZ <- ((p1-p2)-(0))/sqrt((pbar*qbar)*(1/n1+1/n2))
observZ

#reject the null hypothesis







