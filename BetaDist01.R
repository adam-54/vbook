#Arguments
x=seq(0, 1, by = 0.01)

#Pdf and Cdf functions
f_x <- dbeta(x, shape1 = 2, shape2 = 5) #pdf
f_x <- pbeta(x, shape1 = 2, shape2 = 5) #cdf

#Figure
plot(x,f_x, type="l",main='Density plot')

#Random sample from normal of size n
set.seed(2022)
n <- 1000
y <-rbeta(n, shape1 = 2, shape2 = 5)

#Histogram
hist(y, main = "Histogram")
