#Arguments
x=seq(0, 1, by = 1)

#Pdf and Cdf functions, 1 trial
f_x <- dbinom(x, 1, 0.2) #pdf
f_x <- pbinom(x, 1, 0.2) #cdf

#Needle plot
plot(x,f_x, type="h",main='Proabability plot')
points(x,f_x,pch=16,cex=1,col="blue") #pch - symbol filled circle

#Random sample from normal of size n
set.seed(2022)
n <- 1000
y <-rbinom(10, 1, 0.2)

#Histogram
hist(y, main = "Histogram")
