#Week 6 Discussions

#9.60------------------------------------------------------------------------------------
n <- 22
df <- 21
samplemean <- 13.4
s <- 6
alpha <- 0.05
popvar <- 16

q.value1 <- qchisq(alpha/2, 21, lower.tail = T)
q.value1

q.value2 <- qchisq(1-alpha/2, 21, lower.tail = T)
q.value2

chi <- ((df*(s^2))/popvar)  
chi

#9.50------------------------------------------------------------------------------------
n <- 64
df <- 63
samplemean <- 3.6
alpha <- 0.05
popvar <- 1.31

q.value <- qchisq(alpha, 63, lower.tail = T)
q.value

chi <- ((df*(s^2))/popvar)  
chi























