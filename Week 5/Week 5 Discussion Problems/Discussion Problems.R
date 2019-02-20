#8.62
E <- 20 #given
z <- 1.96 #given from the z table at .4750

range <- 600-30 #given in the problem
sigma <- range*(1/4) 

n <- ((z*sigma)/E)^2
n

#8.54
E <- 0.03 #given
z <- 1.645 #given from the z table at .4500

p <- 0.40
q <- 1-0.40

n <- ((z^2)*p*q)/E^2
n
