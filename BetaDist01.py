import numpy as np
from scipy.stats import beta
import matplotlib.pyplot as plt

#Linspace - evenly spaced number. 
#Arguments for specified parameters
a, b = 2, 5
x = np.linspace(beta.ppf(0.001,a,b),beta.ppf(0.999,a,b), 100)
f_x = beta.pdf(x,a,b) #pdf
#f_x = beta.cdf(x,a,b) #cdf

#Figure
fig = plt.figure()
ax = plt.axes()
ax.plot(x, f_x)


#Random sample of size n
np.random.seed(2022)

n = 1000
rand = beta.rvs(a,b,size=n)

#Hitogram, alpha - transparency, rwidth - bar width
n, bins, patches = plt.hist(x=rand, bins='auto', color='#0504aa',alpha=0.7, rwidth=0.9)
