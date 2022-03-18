import numpy as np
from scipy.stats import norm
import matplotlib.pyplot as plt

#Linspace - evenly spaced number. 
#Norm.Ppf critical values from standard normal distribution
x = np.linspace(norm.ppf(0.001),norm.ppf(0.999), 100)
f_x = norm.pdf(x,0,1) #pdf
#f_x = norm.cdf(x,0,1) #cdf

#Figure
fig = plt.figure()
ax = plt.axes()
ax.plot(x, f_x)


#Random sample of size n
np.random.seed(2022)

n = 1000
rand = norm.rvs(size=n)

#Hitogram, alpha - transparency, rwidth - bar width
n, bins, patches = plt.hist(x=rand, bins='auto', color='#0504aa',alpha=0.7, rwidth=0.9)
