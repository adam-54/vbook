import numpy as np
from scipy.stats import bernoulli
import matplotlib.pyplot as plt

#Arguments
p=0.3
x = 0,1 #0 - failure, 1 - success
f_x = bernoulli.pmf(x,p) #pdf
f_x = bernoulli.cdf(x,p) #cdf

#Figure
fig = plt.figure()
ax = plt.axes()
ax.plot(x, f_x, 'bo', markersize=8) #'bo' for cirlce markers
#alpha-shading, lw-line weight,b-  blue needles
ax.vlines(x, 0, f_x, colors='b', lw=3, alpha=0.5)

#Random sample of size n
np.random.seed(2022)

n = 1000
rand = bernoulli.rvs(p,size=n)

#Hitogram, alpha - transparency, rwidth - bar width
n, bins, patches = plt.hist(x=rand, bins='auto', color='#0504aa',alpha=0.5, rwidth=0.9)
