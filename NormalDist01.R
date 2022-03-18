#Arguments
x=seq(-3, 3, by = 0.1)

#Pdf and Cdf functions
f_x <- dnorm(x, mean = 0, sd = 1) #pdf
f_x <- pnorm(x, mean = 0, sd = 1) #cdf

#Figure
plot(x,f_x, type="l",main='Density plot')

#Random sample from normal of size n
set.seed(2022)
n <- 1000
y <-rnorm(n, mean = 0, sd = 1)

#Histogram
hist(y, main = "Histogram")
