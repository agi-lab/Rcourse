---
title: 'Data visualisation in Base R'
---



# Data visualisation in Base R

## Learning outcomes

By the end of this tutorial, you should be able to

- draw and edit curves and plots in R
- perform basic interaction with R plots
- present and summarise statistical data with visualisation tools
- manage graphical windows in R


**Warning:** the materials here are so-called "Base R". There are easier (and often better) ways of doing data visualisations with certain packages (such as "ggplot2" or "plotly"; see next sections).

Note that page numbers refer to the book [The R
Software](http://biostatisticien.eu/springeR/index-en.html).


## Basic plot: plot() and points() functions - Pages 156-158

The plot() and points() functions are extremely useful for creating basic exploratory plots. Consider the data set `longley` (included in R). One can obtain a description of the data using the `?longley` command.

Say we are interested to find out if the **number of armed forces** and **number of unemployed** move together over time. The following graph would be useful:

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/unnamed-chunk-1-1.png" width="80%" />

So how do we create such a graph?

## The plot() function
- In R, plots are created layer by layer, so we begin with a simple plot and add elements.
- To create the simple basic plot we use the plot() function.
- The arguments are a vector of `x` values and a vector of `y` values.


```r
plot(longley$Year, longley$Armed.Forces)
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/unnamed-chunk-2-1.png" width="80%" />

- A decent start, but could be greatly improved. What would you change about this graph?

### Plot() Arguments - type
- Time series data should generally be a line graph. We can change the plot from points to a line by changing the argument 'type' to "l". By default, this was set to "p" for point. Another option is "b" for both line and point.

```r
plot(longley$Year, longley$Armed.Forces, type="l")
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/unnamed-chunk-3-1.png" width="80%" />

- Looking better already!

### Plot() Arguments - Titles
- Let us add some titles to improve the readability of our plot
- We would like to add axis labels, a main title and a subtitle

```r
plot(longley$Year, longley$Armed.Forces, type="l", main="Armed Forces (1947-1962)", sub="Exploratory analysis",
     xlab="Year", ylab="Number")
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/unnamed-chunk-4-1.png" width="80%" />

Awesome. Now let us add the second variable, **Number Unemployed**.

### The points() function
- The `points()` function has the same basic arguments as `plot()`, but does not create an entirely new plot.
- Instead, it adds the points to the previously created plot.


```r
plot(longley$Year, longley$Armed.Forces, type="l", main="Armed Forces and Unemployment (1947-1962)", sub="Exploratory analysis",
     xlab="Year", ylab="Number")
points(longley$Year, longley$Unemployed, type="l")
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/unnamed-chunk-5-1.png" width="80%" />

- Oops! The `points()` function does not adjust limits of the axis automatically to fit all the new data, so the new line goes off the edge of the plot.

### Plot() Arguments - ylim
- We can change the value of the 'ylim' argument in `plot()`, to change the `y` limits. The input is a vector of length 2: `c(min, max)`.
- The same applies for 'xlim'.

```r
plot(longley$Year, longley$Armed.Forces, type="l", main="Armed Forces and Unemployment (1947-1962)", sub="Exploratory analysis",
     xlab="Year", ylab="Number", ylim=c(0,600))
points(longley$Year, longley$Unemployed, type="l")
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/unnamed-chunk-6-1.png" width="80%" />
- Better... but it's still difficult to distinguish between the lines. Let's add some colour!

### Plot() arguments - col
- Use the 'col' option to choose a colour note the syntax: you need to specify the colour by a string, e.g.  ` col = 'red'`).
- We also make the lines broader by using argument `lwd = 2`, for 'line width'.

```r
plot(longley$Year, longley$Armed.Forces, type="l", lwd = 2, main="Armed Forces and Unemployment (1947-1962)", sub="Exploratory analysis",
     xlab="Year", ylab="Number", ylim=c(0,600))
points(longley$Year, longley$Unemployed, type="l", lwd = 2, col="red")
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/unnamed-chunk-7-1.png" width="80%" />

- There is a wide range of colours built into R. You can use Google to find them!

- For reference, the colors() function also returns the names of the 657 colours known to R. For example, if you want to get the different shades of orange, you can use the instruction:


```r
colors()[grep("orange",colors())]
```

 [1] "darkorange"  "darkorange1" "darkorange2" "darkorange3" "darkorange4"
 [6] "orange"      "orange1"     "orange2"     "orange3"     "orange4"    
[11] "orangered"   "orangered1"  "orangered2"  "orangered3"  "orangered4" 

## legend() function
- The last missing piece is a legend to help explain which line is which.
- the legend() function does this for us.


```r
plot(longley$Year, longley$Armed.Forces, type="l", lwd = 2, main="Armed Forces and Unemployment (1947-1962)", sub="Exploratory analysis",
     xlab="Year", ylab="Number", ylim=c(0,600))
points(longley$Year, longley$Unemployed, type="l", lwd = 2, col="red")
legend('bottomright', legend=c("Armed Forces","Unemployed"), col=c("black","red"), lty=c(1,1))
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/unnamed-chunk-8-1.png" width="80%" />

Any trends here?


## Empirical Copula

Beside the log-transformation, a good way to scale down big observations is to use function `ecdf()` and draw the empirical copula (a standardised repartition of the pairs of data points, to a `\([0,1]\times [0,1]\)` rectangle) of a paired dataset

```r
attach(mammals) 
plot(ecdf(body)(body),ecdf(brain)(brain), xlab = "ecdf of body", ylab = "ecdf of brain" )
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/copula-1.png" width="80%" />


## Basic plot: the curve() function - Pages 162

- To draw a curve (given by a function of `x`) on the interval specified by the bounds `from` and `to`	


```r
curve(dnorm(x, 0, 1/3), from=-2, to=2, lwd = 2)
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/curve-1.png" width="80%" />

```r
curve(x*sin(1/x), from =-1/10, to=1/10, lwd = 2)
## Warning in sin(1/x): NaNs produced
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/curve-2.png" width="80%" />

- The previous plot does not look very good: it is too 'rough'. This has a quick fix!


```r
# with argument 'n' we raise the # of points at which the function is evaluated (improves resolution)
curve(x*sin(1/x), from =-1/10, to=1/10, lwd = 2, n = 500)
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/curve2-1.png" width="80%" />

- Note also the use of argument `lwd` that makes the lines bigger

## Basic plot: adding text - Page 169-170

- Let's take a look at possible improvements of our plots, such as adding text and mathematical expressions or changing margins.
- Take a careful look at the code and identify which line has added which element.


```r
# set margins of the graph (order: bottom, left, top, and right). The default is c(5.1, 4.1, 4.1, 2.1).
par(mar=c(5,5,2,2))
curve(x*sin(1/x), from =-1/10, to=1/10, lwd = 2, n = 500, col = "darkblue", xlab=expression(theta[i]), ylab=expression(y[i]), cex.lab = 2)
text(0, -0.05, "Fun with R", cex = 1.5, col = "purple")
text(0, 0.05, expression(y==theta*sin(1/theta)))
p <- 4
text(0, -0.075, bquote(beta[.(p)]), cex = 2)
mtext("Marginal text", side=4)
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/text-1.png" width="80%" />

Notes: 

- argument 'cex' allows you to change the size of elements
- we used a R expression to create math notations 
- a bquote is useful when your math expression is dependent on the value of a variable (here the value of p is displayed)

## Basic plot: axes - Page 172-173


```r
plot.new()
lines(x=c(0,1), y=c(0,1), col="red", lwd = 5)
axis(side=1, at=c(0, 0.5, 1), labels=c("a","b","c"), col="blue", lwd = 3)
axis(side=2, at=c(0, 0.5, 1), labels=c("I","II","III"), col="darkgreen", lwd = 3)
axis(side=4, at=c(0, 0.333, 0.667, 1), labels=c("i","ii", "iii", "iv"), col="purple", lwd = 3)
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/axis-1.png" width="80%" />


## Statistical visualisation: other types of charts

- R has a wide range of built-in functions that can be used to visualise data. Knowing/using them will save you time, compared to coding yourself complex statistical plots from scratch.

- In the next few sections we use the same dataset as the textbook (reformatted as `sample_data.csv`) for illustration purposes.

### Statistical visualisation - qualitative/discrete variables - Pages 358,362


```r
pie(table(situation), cex = 1.75, main = 'Marital status of participants')
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/pie-1.png" width="80%" />


```r
dotchart(as.numeric(table(fat)), col = rainbow(8, start = 0.4, end = 1), labels=levels(fat), pch = 19, cex = 1.75, xlab = '# of participants', main = 'Type of fat in the diet')
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/dot-1.png" width="80%" />


### Statistical visualisation - continuous variables - Pages 366,369


```r
hist(height,col="green",main="")
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/hist-1.png" width="80%" />


```r
boxplot(height ~ gender, col="orange", xlab = 'gender', ylab = 'height (cm)')
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/boxplot-1.png" width="80%" />





### Statistical visualisation - bivariate qualitative variables - Pages 371-372

```r
# turn a contingency table into a proportions table
tss <- prop.table(table(situation, gender), 2)
barplot(tss,bes=T,leg=T)
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/barplot-1.png" width="80%" />

```r
barplot(tss,bes=F,leg=T)
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/barplot-2.png" width="80%" />



## Adding a legend (Page 173-174)


```r
set.seed(1)
hist(rnorm(10000, -3, 1), breaks = 50, prob = T, col = "lightblue", xlab = "", xlim = c(-8, 8), main = "Two empirical distributions")
hist(rnorm(10000, 3, 1), breaks = 50, prob = T, col = "blue", add =T)
curve(dnorm(x, -3, 1), lwd = 3, add = T, col = "red")
curve(dnorm(x, 3, 1), lwd = 3, add = T, col = "red")
legend("topright", ncol = 1, cex = 1.5, legend=c("Sample 1", "Sample 2"), fill=c("lightblue", "blue"))
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/caption-1.png" width="80%" />

Notes:

- With argument 'xlab' we force the range of 'x' values to be what we want
- Argument `prob = TRUE` means the histogram is on a probability scale (not a count scale), and hence you can directly compare it to a theoretical pdf (the Normal in this case)





## Graphical windows - Splitting the Graphics Window - Page 154

You can easily have several plots (of possibly different types) in one plot, as below.


```r
# Split the window to have 3 lines and 2 columns of plots (to be filled by column)
par(mfcol=c(3,2))
# First plot
plot(1:3,1:3,col="red",type="l", xlab= "", ylab= "")	
plot(1:5,1:5,col="orange",type="p", xlab= "", ylab= "")	
plot(1:7,1:7,col="blue",type="b", xlab= "", ylab= "")	
plot(ts(rnorm(100)),col="purple", xlab= "", ylab= "")
curve(sqrt(x^2 - x^4), from = -1, to = 1, lwd = 2, xlab= "", ylab= "")
hist(rexp(100,1/2), main = "", xlab= "", ylab= "")
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/mfrow-1.png" width="80%" />

## Graphical windows - Opening, closing and saving graphical windows - Pages 151-153

- To open a new graphical window, use the instructions `windows()` or `win.graph()` (for MacOS, use `quartz()`).

- To close some graphical device, use: `dev.off(device-number)`.

- To save a plot:

    -  if the plot has **already** been drawn in a window, use

        -  `savePlot(filename="Rplot",type="pdf")`

    - You can also specify the export plot before it is created


```r
windows()
pdf(file="example12.pdf")
hist(runif(100))	
dev.off()
```

## Additional Notes

### Additional Notes: the segments() and lines() functions - Pages 158-159

To join points with straight lines on an existing plot:	

```r
# create an empty plot
plot(0,0,"n", xlab="", ylab="") 
# add a segment joining two points
segments(x0=-0.5, y0=0, x1=1, y1=-0.5, col = "red", lwd = 4)
# add two segments, joining three points: first argument is the 'x' values, second is the 'y' values
lines(c(-1,0,1), c(-1,0.2,1), col = "blue", lwd = 4) 
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/straight-1.png" width="80%" />



### Additional Notes: the abline() function - Pages 159

To draw a straight line of equation `\(y=a+bx\)` (specified by the arguments a and b), or a horizontal line (argument h), or a vertical line (argument v)	


```r
plot(0,0,"n", xlab="", ylab="") 
abline(h=0.5, v=0, col = "purple", lwd = 4)
abline(a=1, b=1, col = "orange", lwd = 4)
```

<img src="/docs/baseR/datavisualistationinbaseR/_index_files/figure-html/abline-1.png" width="80%" />




### Additional Notes: Interacting with the plot: the locator() function - Page 175

The `locator()` function is used to place a point on a plot, or to get its coordinates with a click of the mouse. It can also be useful to add text (or a caption) at a specific location, thanks to the mouse.


```r
# Enter the following instructions, then click anywhere on the plot.
plot(1,1, xlab = "", ylab = "")
text(locator(1), labels="What a cool dot!")
```

### Additional Notes: Interacting with the plot: the identify() function - Page 175

The `identify()` function is used to identify and mark points already present on a plot.


```r
# Enter the following instructions, then click next to points on the plot. Use ESC to exit the interactive mode.
plot(swiss[,1:2])
x <- identify(swiss[,1:2], labels=rownames(swiss))
x
```




# Relevant Exercises

- 7.1-7.16, 11.14-11.18


