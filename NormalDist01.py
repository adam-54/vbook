import numpy as np
from scipy.stats import norm
import matplotlib.pyplot as plt

#Linspace - evenly spaced number. 
#Norm.Ppf critical values from standard normal distribution
x = np.linspace(norm.ppf(0.001),norm.ppf(0.999), 100)
f_x = norm.pdf(x) #pdf
#f_x = norm.cdf(x) #cdf

#Figure
fig = plt.figure()
ax = plt.axes()
ax.plot(x, f_x)


#Random number:
np.random.seed(10)
rand = norm.rvs(size=1000)

#Hitogram, alpha - transparency, rwidth - bar width
n, bins, patches = plt.hist(x=rand, bins='auto', color='#0504aa',alpha=0.7, rwidth=0.9)
