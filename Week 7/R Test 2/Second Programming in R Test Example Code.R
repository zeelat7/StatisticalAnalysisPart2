# Example code and illustrations related to the Second Programming Test in R

# Problem #1

# Suppose a comparison of three binomial distributions is desired with
# n = 6 and three different probabilities p = 0.25, 0.5 and 0.75.  This can be 
# accomplished in R using the dbinom() function.

help(dbinom)

# We will generate three different distributions and form a vertical bar chart. 
# It is necessary to create a vector of outcomes 0, 1, 2, ..., 6 since n = 6.

x <- seq(0, 6)
x 

b1 <- dbinom(x, 6, 0.25)
b2 <- dbinom(x, 6, 0.5)
b3 <- dbinom(x, 6, 0.75)

prob <- rbind(b1,b2,b3)
barplot(prob, beside = TRUE)

# A similar approach can be used to generate the cumulative distributions.

help(pbinom)

b.25 <- pbinom(x, 6, 0.25, lower.tail = TRUE)
b.50 <- pbinom(x, 6, 0.5, lower.tail = TRUE)
b.75 <- pbinom(x, 6, 0.75, lower.tail = TRUE)

prob <- rbind(b.25, b.50, b.75)

barplot(prob, beside = TRUE, main = "Three Cumulative Distributions",
        ylab = "Cumulative Probability", xlab = "Number of Successes",
        col = c("darkblue","red","green"), legend = rownames(prob),
        names.arg = c("0","1","2","3","4","5","6")) 

# There are a variety of options available for adding titles, labels, colors, etc.
# Learning about the different possibilities involves research using available 
# references and searching on the internet.  This is a fact of life with R.

barplot(prob, beside = TRUE, main = "Three Cumulative Distributions",
        ylab = "Cumulative Probability", xlab = "Number of Successes",
        col = c("darkblue","red","green"), legend.text = c("blue 0.25", "red 0.50",
        "green 0.75"), names.arg = c("0","1","2","3","4","5","6"), 
        args.legend = list(x=7,y=0.95))
abline(h = 1.0, lty = 'dotted')

#================================================================================
# Problem #2

# The exponential distribution is used to model waiting times.  Examples might be
# the waiting time for service or the waiting time for a device to fail.  The
# following example shows how to compare different distributions on the same plot.
# Two different rates will be used, L = 1 and L = 2.

# Since the exponential distribution is continuous, it will be evaluated at a 
# series of values over a wide enough range which will include the density functions.

help(dexp)

x <- seq(0, 5, 0.05)
x

e1 <- dexp(x, 1)
e2 <- dexp(x, 2)

plot(x, e2, type = "l", col = "red", main = "Two Exponential Density Functions",
     ylab = "Density", lwd = "2")
lines(x, e1, type = "l", col = "blue", lwd = "2")
legend(list(x=3,y=1), legend = c("Red denotes rate = 2", "Blue denotes rate = 1"))

# The quantile and cumulative distribution functions come in handy.

p <- 0.75  
qexp(p, 1, lower.tail = TRUE)  # 1.386294
pexp(1.386294, 1, lower.tail = TRUE)  # 0.2500001

cord.x <- c(0,seq(0, 1.386294, 0.01),1.386294)
cord.y <- c(0, dexp(seq(0, 1.386294, 0.01),1), 0)
curve(dexp(x,1),xlim=c(0,5),main="Exponential Density   Rate = 1", ylab = "density")
polygon(cord.x,cord.y,col="skyblue")
legend(list(x=2,y=0.5), legend = c("Blue area is 75% of the distribution.",
                                   ("75% quantile is 1.386294.")))

# Suppose we want to find the balance point betwee the right tail of one 
# distribution and the left tail of the other.  One way to do this is to 
# define an error bound and use logical comparisons to find which element in x
# results in a sufficiently small difference between the two tail areas.  The
# precision of this comparison can be improved by choosing closer points in x.

 x <- seq(0, 5, 0.05)

z.tail <- pexp(x, 1, lower.tail = FALSE) 
y.tail <- pexp(x, 2, lower.tail = TRUE)
x[(abs(z.tail - y.tail) < 0.03)]

# One way to pinpoint which element is of interest is to use which.min().

which.min(abs(z.tail - y.tail))   # The 11th element of x seems to work.

plot(x, e2, type = "l", col = "red", main = "Two Exponential Density Functions",
ylab = "Density", lwd = "2")
lines(x, e1, type = "l", col = "blue", lwd = "2")
legend(list(x=3,y=2), legend = c("Red denotes rate = 2", "Blue denotes rate = 1",
"Balance at 0.5"))
abline(v = 0.5)

#===============================================================================
# Problem #3

# Student's t statistic is used often for statistical inference. The keyboard data 
# are data from 50 students testing two different keyboards.  Each student used 
# both keyboards so the data are paired.  The following examples show the difference
# that results from testing the data as paired results, versus not paired.

keyboard <- read.csv(file = "/Users/Zeeshan/Desktop/PREDICT 401/Week 7/keyboard.csv", sep=",")
str(keyboard)
summary(keyboard)

# the t.test function can be used for this purpose. Here is an unpaired t test 
# followed by a paired t test.  The paired t test is more efficient.  This becomes
# apparent when the variance of the paired differences is compared to the separate
# variances of STYLE_A and STYLE_B.  Why is there a difference?

t.test(keyboard$STYLE_A, keyboard$STYLE_B, alternative = c("two.sided"), mu = 0, 
       paired = FALSE, var.equal = TRUE, conf.level = 0.95)

t.test(keyboard$STYLE_A, keyboard$STYLE_B, alternative = c("two.sided"), mu = 0, 
       paired = TRUE, var.equal = TRUE, conf.level = 0.95)

#===============================================================================
# Problem #4

# The central limit theorem is fundamental to statistics.  It provides one way to 
# obtain a sampling distribution for the mean and other statistics.  Earthquake 
# magnitude data will be used to illustrate the impact of increasing sample size.

mag <- c(0.70, 0.74, 0.64, 0.39, 0.70, 2.20, 1.98, 0.64, 1.22, 0.20, 1.64, 1.02, 
         2.95, 0.90, 1.76, 1.00, 1.05, 0.10, 3.45, 1.56, 1.62, 1.83, 0.99, 1.56,
         0.40, 1.28, 0.83, 1.24, 0.54, 1.44, 0.92, 1.00, 0.79, 0.79, 1.54, 1.00,
         2.24, 2.50, 1.79, 1.25, 1.49, 0.84, 1.42, 1.00, 1.25, 1.42, 1.15, 0.93,
         0.40, 1.39)

hist(mag)
summary(mag)

# To demonstrate the central limit theorem, repeated random samples will be 
# drawn from mag and the sample mean calculated and saved.  Two different sample 
# sizes will be used, n = 10 and n = 40.

set.seed(124)
mean.s1 <- numeric(0)
mean.s2 <- numeric(0)
N <- 10000
for (k in 1:N){
     mean.s1[k] <- mean(sample(mag, 10, replace = TRUE))
     mean.s2[k] <- mean(sample(mag, 40, replace = TRUE))
   }

par(mfrow = c(1,2))
hist(mean.s1, xlim = c(0.25, 2.25))
hist(mean.s2, xlim = c(0.25, 2.25))
par(mfrow = c(1,1))

# When the variances of mean.s1 and mean.s2 are computed, it is apparent the second
# variance is approximately a quarter of the first since the sample size was
# increased fourfold.
var(mean.s1)
var(mean.s2)

# Demonstration of convergence to a normal distribution.

m <- mean(mag)
m
std <- sd(mag)/sqrt(40)
std
x <- seq(0.8, 1.7, 0.01)
hist(mean.s2, freq = FALSE, col = "darkblue", xlab = "Sample Average Magnitude",
     main = "Histogram of 10,000 Sample Averages n = 40", xlim = c(0.8, 1.7))
curve(dnorm(x, m, std), col = "orange", lwd = 2, add = TRUE)
abline(v= m, col = "orange", lty = 2, lwd = 2)
legend("topright", legend = c("mean = 1.2336", "standard deviation = 0.1049"))

#===============================================================================
# Problem #5

# The test question involves programming a function to do matrix calculations and
# generate a Pearson Chi-squared value that can be tested.  An illustration
# of how to program a function to solve a system of linear equations follows.

# System   Mv = y

result <- function(M, y){
  
  # Make sure matrix is square.
  if (nrow(M) != ncol(M)) {
    x <- c("Not Square")
  }
  # Check the number of unknowns.
  else if (length(y) != ncol(M)) {
    x <- c("Wrong Variable Count")
  }
  # Use determinant to check that a solution exists.
  else if (abs(det(M)) < 0.000001) {
    x <- c("No Solution")
    }
  else {
    x <- solve(M)%*%y
    }
    return(x)
}

# An example with an unsquare matrix.

r1 <- c(1, 1)
r2 <- c(1, 1)
r3 <- c(2, 3)
coef <- (rbind(r1,r2,r3))
v <- c(0, 4)
result(coef,v)

# An example with the wrong variable count.

r1 <- c(1, 1)
r2 <- c(1, 1)
coef <- (rbind(r1,r2))
v <- c(0)
result(coef,v)

# An example with no solution.

r1 <- c(1, 1)
r2 <- c(1, 1)
coef <- (rbind(r1,r2))
v <- c(0, 4)
result(coef,v)

# Now an example with a solution.

r1 <- c(1,-1)
r2 <- c(1, 1)
coef <- (rbind(r1,r2))
v <- c(0, 4)
result(coef,v)

# Now check to see if y can be reproduced.

coef%*%result(coef,v)

# The problem involves generating a 2x2 contingency table with marginal totals added. 
# This table will then be submitted to a function which will calculate Pearson's 
# Chi-square statistic. The following code shows how the counts in x can be operated 
# upon to calculate expected values for the cells in the table x.

x <- as.table(rbind(c(25,5),c(5,25)))
x <- addmargins(x)
x

# x can be described as a 2x2 contingency table with marginal totals added.     

e11 <- x[3,1]*x[1,3]/x[3,3]
e12 <- x[3,2]*x[1,3]/x[3,3]
e21 <- x[3,1]*x[2,3]/x[3,3]
e22 <- x[3,2]*x[2,3]/x[3,3]

# The resulting expected values are shown below.

c(e11, e12, e21, e22)

#===============================================================================
# Learning R necessitates doing some literature research and experimentation.
# The texts by Kabacoff and Davies are good starting points.