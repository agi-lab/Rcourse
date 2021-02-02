---
title: 'Data manipulation, operations and work strategy in Base R'
---



# Data manipulation, operations and work strategy in Base R

## Learning outcomes

By the end of this topic, you should be able to


- extract elements from different R data structures in an efficient way

- manipulate different types of R data structures with appropriate R functions

- implement work strategies of R and R Studio

**Warning:** the materials here are so-called "Base R". There are easier (and often better) ways of doing things with the "tidyverse" ecosystem (see next section).

Note that page numbers refer to the book [The R
Software](http://biostatisticien.eu/springeR/index-en.html).



## Vectors - Extracting elements from vectors - Method I - Page 100
By using the index/indices


```r
vec <- c(2,4,6,8,3)
vec[2]
## [1] 4
vec[-2]
## [1] 2 6 8 3
vec[2:5]
## [1] 4 6 8 3
vec[-c(1,5)]
## [1] 4 6 8
```

## Vectors - Extracting elements from vectors - Method II - Pages 100-101
	
By using logical masks (that is, by specifying whether each element will be extracted using a logical index):


```r
vec
## [1] 2 4 6 8 3
vec[c(F,F,T,T,F)]
## [1] 6 8
vec[vec>4]
## [1] 6 8
```

Advantages: fast execution and easy communication.	



## Vectors - Extracting elements from vectors - Three useful functions - Page 101


```r
x <- c(1,9,0,0,-5,9,-5)
which.max(x)
## [1] 2
which.min(x)
## [1] 5
which(x==0)
## [1] 3 4
```



## Matrix - Extraction from matrices- Method I - Pages 102-103	

By using indices `X[indr, indc]`

- `indr` is the vector of indices of rows and  `indc` is the vector of indices of columns to extract
- omitting `indr` (respectively `indc`) means that all rows are selected (respectively all columns)
- `indr` and `indc` can be preceded by a minus sign (-) to indicate elements not to extract


```r
Mat <- matrix(1:12,nrow=4,byrow=TRUE)
Mat
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
## [3,]    7    8    9
## [4,]   10   11   12
Mat[2,3]
## [1] 6

Mat[,1]
## [1]  1  4  7 10

Mat[c(1,4),]
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]   10   11   12
Mat[3,-c(1,3)]
## [1] 8
```

## Matrix - Extraction from matrices- Method II - Pages 102-103

By using logical masks `X[mask]`

- a mask is a matrix of logical values (TRUE or FALSE) of the same size as X, indicating which elements to extract


```r
Mat <- matrix(1:12,nrow=4,byrow=TRUE)
MatLogical <- matrix(c(TRUE,FALSE),nrow=4,ncol=3)
Mat
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
## [3,]    7    8    9
## [4,]   10   11   12
MatLogical
##       [,1]  [,2]  [,3]
## [1,]  TRUE  TRUE  TRUE
## [2,] FALSE FALSE FALSE
## [3,]  TRUE  TRUE  TRUE
## [4,] FALSE FALSE FALSE
Mat[MatLogical]
## [1] 1 7 2 8 3 9
```

## Matrix - The which() function for matrices - Page 104


```r
m <- matrix(c(1,2,3,1,2,3,2,1,3),3,3)
m
##      [,1] [,2] [,3]
## [1,]    1    1    2
## [2,]    2    2    1
## [3,]    3    3    3
which(m == 1) 
## [1] 1 4 8
# m is seen as the concatenation of its columns
which(m == 1,arr.ind=TRUE)
##      row col
## [1,]   1   1
## [2,]   1   2
## [3,]   2   3
# this gives the indices (row and column) of all elements = 1
```

## Data frame example


```r
X <- data.frame(GENDER=c("F","M","M","F"),
Height=c(165,182,178,160),
Weight=c(50,65,67,55),
Income=c(80,90,60,50))
row.names(X)<-c('Aiyana','James','John','Abbey')

X
##        GENDER Height Weight Income
## Aiyana      F    165     50     80
## James       M    182     65     90
## John        M    178     67     60
## Abbey       F    160     55     50
X[3,2]
## [1] 178
X['John','Height']
## [1] 178

X$Weight
## [1] 50 65 67 55
X["John",]
##      GENDER Height Weight Income
## John      M    178     67     60
X[,"Height"]
## [1] 165 182 178 160
```



## The attach() function

The function `attach(some.data.frame)` creates a workspace where each variable of the data frame can be accessed directly (without using the dollar sign `$`). Therefore it can reduce the length of codes. However, this space does not 'communicate' with the working directory. Therefore, if you make a change in the data frame, it will not be effective in this additional workspace. We then recommend to be very careful with the `attach()` function (especially for large projects).


```r
attach(X)
GENDER
## [1] "F" "M" "M" "F"
# We update GENDER in our data frame X
X$GENDER <- c("F", "F", "F", "F")
X$GENDER
## [1] "F" "F" "F" "F"
# However, the version of X we 'attached' has NOT been updated
GENDER
## [1] "F" "M" "M" "F"
```

## dplyr - Introduction

dplyr is a commonly used package. It makes manipulating dataframes very easy and intuitive. To install (and load) any package, just type


```r
install.packages('dplyr') # Installs the package, you need this only once
library('dplyr') # Loads the package, you need this every time you use it
```

There are 6 main functions in dplyr:

* filter - selects rows

* select - selects columns

* arrange - sorts rows by some order

* mutate - creates new columns

* group_by - groups certain rows together

* summarise - provides summaries of grouped rows


## dplyr - Filter and Select

Here some examples using the in-built data frame 'mtcars'


```r

# Filters the dataset for observations with mpg greater than 20
filter(mtcars, mpg > 30) 
##                 mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Fiat 128       32.4   4 78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic    30.4   4 75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla 33.9   4 71.1  65 4.22 1.835 19.90  1  1    4    1
## Lotus Europa   30.4   4 95.1 113 3.77 1.513 16.90  1  1    5    2

# Returns the dataframe mtcars but only with the 3 specified columns
select(mtcars, mpg, cyl, wt) 
##                      mpg cyl    wt
## Mazda RX4           21.0   6 2.620
## Mazda RX4 Wag       21.0   6 2.875
## Datsun 710          22.8   4 2.320
## Hornet 4 Drive      21.4   6 3.215
## Hornet Sportabout   18.7   8 3.440
## Valiant             18.1   6 3.460
## Duster 360          14.3   8 3.570
## Merc 240D           24.4   4 3.190
## Merc 230            22.8   4 3.150
## Merc 280            19.2   6 3.440
## Merc 280C           17.8   6 3.440
## Merc 450SE          16.4   8 4.070
## Merc 450SL          17.3   8 3.730
## Merc 450SLC         15.2   8 3.780
## Cadillac Fleetwood  10.4   8 5.250
## Lincoln Continental 10.4   8 5.424
## Chrysler Imperial   14.7   8 5.345
## Fiat 128            32.4   4 2.200
## Honda Civic         30.4   4 1.615
## Toyota Corolla      33.9   4 1.835
## Toyota Corona       21.5   4 2.465
## Dodge Challenger    15.5   8 3.520
## AMC Javelin         15.2   8 3.435
## Camaro Z28          13.3   8 3.840
## Pontiac Firebird    19.2   8 3.845
## Fiat X1-9           27.3   4 1.935
## Porsche 914-2       26.0   4 2.140
## Lotus Europa        30.4   4 1.513
## Ford Pantera L      15.8   8 3.170
## Ferrari Dino        19.7   6 2.770
## Maserati Bora       15.0   8 3.570
## Volvo 142E          21.4   4 2.780

# Returns the columns mpg and cyl for rows with wt greater than 2
select(filter(mtcars, wt > 2), mpg, cyl)
##                      mpg cyl
## Mazda RX4           21.0   6
## Mazda RX4 Wag       21.0   6
## Datsun 710          22.8   4
## Hornet 4 Drive      21.4   6
## Hornet Sportabout   18.7   8
## Valiant             18.1   6
## Duster 360          14.3   8
## Merc 240D           24.4   4
## Merc 230            22.8   4
## Merc 280            19.2   6
## Merc 280C           17.8   6
## Merc 450SE          16.4   8
## Merc 450SL          17.3   8
## Merc 450SLC         15.2   8
## Cadillac Fleetwood  10.4   8
## Lincoln Continental 10.4   8
## Chrysler Imperial   14.7   8
## Fiat 128            32.4   4
## Toyota Corona       21.5   4
## Dodge Challenger    15.5   8
## AMC Javelin         15.2   8
## Camaro Z28          13.3   8
## Pontiac Firebird    19.2   8
## Porsche 914-2       26.0   4
## Ford Pantera L      15.8   8
## Ferrari Dino        19.7   6
## Maserati Bora       15.0   8
## Volvo 142E          21.4   4
```

## dplyr - Pipeline operator, Arrange and Mutate
As you apply more operations to your dataframe, the nested functions you use can get hard to read

Luckily, the dplyr package includes the useful 'pipeline' operator %>% (*orally referred to as "pipe", such as in "A pipe B"*). Think of it as "and then"

```r

# Take the dataframe, and then filter for mpg greater than 20
mtcars %>% filter(mpg>30)
##                 mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Fiat 128       32.4   4 78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic    30.4   4 75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla 33.9   4 71.1  65 4.22 1.835 19.90  1  1    4    1
## Lotus Europa   30.4   4 95.1 113 3.77 1.513 16.90  1  1    5    2

# Do the same, and then select certain columns
mtcars %>% 
  filter(mpg > 30) %>%
  select(mpg, wt)
##                 mpg    wt
## Fiat 128       32.4 2.200
## Honda Civic    30.4 1.615
## Toyota Corolla 33.9 1.835
## Lotus Europa   30.4 1.513

########################### arrange ##################################
# Sort the rows in ascending order of wt
mtcars %>%
  filter(mpg > 30) %>%
  arrange(wt)
##                 mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Lotus Europa   30.4   4 95.1 113 3.77 1.513 16.90  1  1    5    2
## Honda Civic    30.4   4 75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla 33.9   4 71.1  65 4.22 1.835 19.90  1  1    4    1
## Fiat 128       32.4   4 78.7  66 4.08 2.200 19.47  1  1    4    1

# Sort the rows in descending order of wt
mtcars %>%
  filter(mpg > 30) %>%
  arrange(desc(wt))
##                 mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Fiat 128       32.4   4 78.7  66 4.08 2.200 19.47  1  1    4    1
## Toyota Corolla 33.9   4 71.1  65 4.22 1.835 19.90  1  1    4    1
## Honda Civic    30.4   4 75.7  52 4.93 1.615 18.52  1  1    4    2
## Lotus Europa   30.4   4 95.1 113 3.77 1.513 16.90  1  1    5    2

########################### mutate ###################################
mtcars %>%
  mutate(double_wt = wt*2, # Creates a new variable called double_wt
         kms_per_gallon = mpg*1.61, # Creates a new variable called kms_per_gallon
         name = row.names(mtcars)) %>%  # Creates a new variable with names of the cars
  select(name, double_wt, kms_per_gallon)
##                   name double_wt kms_per_gallon
## 1            Mazda RX4     5.240         33.810
## 2        Mazda RX4 Wag     5.750         33.810
## 3           Datsun 710     4.640         36.708
## 4       Hornet 4 Drive     6.430         34.454
## 5    Hornet Sportabout     6.880         30.107
## 6              Valiant     6.920         29.141
## 7           Duster 360     7.140         23.023
## 8            Merc 240D     6.380         39.284
## 9             Merc 230     6.300         36.708
## 10            Merc 280     6.880         30.912
## 11           Merc 280C     6.880         28.658
## 12          Merc 450SE     8.140         26.404
## 13          Merc 450SL     7.460         27.853
## 14         Merc 450SLC     7.560         24.472
## 15  Cadillac Fleetwood    10.500         16.744
## 16 Lincoln Continental    10.848         16.744
## 17   Chrysler Imperial    10.690         23.667
## 18            Fiat 128     4.400         52.164
## 19         Honda Civic     3.230         48.944
## 20      Toyota Corolla     3.670         54.579
## 21       Toyota Corona     4.930         34.615
## 22    Dodge Challenger     7.040         24.955
## 23         AMC Javelin     6.870         24.472
## 24          Camaro Z28     7.680         21.413
## 25    Pontiac Firebird     7.690         30.912
## 26           Fiat X1-9     3.870         43.953
## 27       Porsche 914-2     4.280         41.860
## 28        Lotus Europa     3.026         48.944
## 29      Ford Pantera L     6.340         25.438
## 30        Ferrari Dino     5.540         31.717
## 31       Maserati Bora     7.140         24.150
## 32          Volvo 142E     5.560         34.454
```

## dplyr - Why use the pipeline operator?

The pipeline operator makes it much easier to read what is going on. Note that the following two pieces of code achieve the same thing.


```r
# Using base R
arrange(select(filter(mtcars, mpg > 30), mpg, wt, cyl), desc(wt))
##                 mpg    wt cyl
## Fiat 128       32.4 2.200   4
## Toyota Corolla 33.9 1.835   4
## Honda Civic    30.4 1.615   4
## Lotus Europa   30.4 1.513   4
```



```r
# Using dplyr
mtcars %>%
  filter(mpg > 30) %>%
  select(mpg, wt, cyl) %>%
  arrange(desc(wt))
##                 mpg    wt cyl
## Fiat 128       32.4 2.200   4
## Toyota Corolla 33.9 1.835   4
## Honda Civic    30.4 1.615   4
## Lotus Europa   30.4 1.513   4
```

It is hard to quickly get what the base R version is doing. In contrast, you can easily interpret the dplyr versions as:

- take the mtcars dataset, **and then**

- filter for mpg > 30, **and then**

- select the columns mpg, wt, cyl, **and then**

- arrange them by descending weight

## dplyr - summarise and group_by

summarise() will give you summary statistics


```r
mtcars %>%
  summarise(mean_mpg = mean(mpg),
            num_cars = n(),
            sd_wt = sd(wt))
##   mean_mpg num_cars     sd_wt
## 1 20.09062       32 0.9784574
```

group_by is a very powerful function that will group rows into different categories. You can then use summarise() to find summary statistics of each group


```r
mtcars %>%
  group_by(cyl) %>% # Group cars by how many cylinders they have
  summarise(avg_mpg = mean(mpg)) # Find the average mpg for each group (cyl)
## `summarise()` ungrouping output (override with `.groups` argument)
## # A tibble: 3 x 2
##     cyl avg_mpg
##   <dbl>   <dbl>
## 1     4    26.7
## 2     6    19.7
## 3     8    15.1
```

Common summary statistics include:

- mean() the average
- sd() the standard deviation
- n() the count


## dplyr - Why use dplyr?

dplyr is generally easier to read and write than base R. The following codes do the same thing

**Base R:**

```r
new_df <- mtcars[mtcars$mpg > 30 & mtcars$wt < 2,]
new_df["kmpl"] <- new_df$mpg * 0.264172 * 1.60934
new_df <- new_df[, c("kmpl", "disp", "wt")]
```

**dplyr:**

```r
new_df <- mtcars %>%
  mutate(name = rownames(mtcars),
         kmpl = mpg * 0.264172 * 1.60934) %>%
  filter(mpg > 30,
         wt < 2) %>%
  select(name,
         kmpl,
         disp,
         wt)
```

In particular, group_by and summarise are very easy to write with dplyr. They are significantly harder to write in base R:

**Base R:**

```r
avg_weight <- aggregate(mtcars$wt,
          by = list(cylinders = mtcars$cyl, 
                    gears = mtcars$gear),
          FUN = mean)

names(avg_weight)[3] <- "Average_weight"

sd_weight <- aggregate(mtcars$wt,
           by = list(cylinders = mtcars$cyl, 
                     gears = mtcars$gear),
           FUN = sd)

names(sd_weight)[3] <- "std_dev_weight"

new_df <- merge(avg_weight, sd_weight, by = c("cylinders", "gears"))
```

**dplyr:**

```r
new_df <- mtcars %>%
  group_by(cyl, gear) %>%
  summarise(avg_weight = mean(wt),
            sd_weight = sd(wt))
## `summarise()` regrouping output by 'cyl' (override with `.groups` argument)
```

## dplyr - More information

- Cheat sheet for dplyr - https://ugoproto.github.io/ugo_r_doc/dplyr.pdf

- Online tutorial - http://genomicsclass.github.io/book/pages/dplyr_tutorial.html

- Pick and choose from this Lynda course on: ["tidyverse"](https://www.lynda.com/R-tutorials/Learning-R-Tidyverse/586672-2.html?org=unsw.edu.au) </p> **If you complete the Lynda course this will give you a certification that you can them add to your LinkedIn account!**




## Work strategy - page 285

Recall that to access files directly, you can set up your working directory using:
	
- setwd("C:/Users/...").
- in Rstudio: Go to Session `\(\rightarrow\)` Set Working Directory

You can also read and execute the contents of an external R script file using the source() function:

- source("C:/Users/.../myscript.R")

Alternatively, you can use the file.choose() function which allows to 'manually' select a file

- source(file.choose())

Note: a R script file has the extension '.R'

## Work strategy - page 285

Workspace and .RData files

- All the objects (vectors, lists, dataframes, functions, etc.) one creates in R are **temporarily** saved in a file on the hard disk, which is called the workspace. When you close your R session those objects are lost.
- Therefore, it is recommended to create separate permanent workspace files for each of your projects. 
- These files have the '.RData' extension.
- Warning: If you load a .RData workspace in your current R session, any object defined in your temporary workspace will be overwritten if there is an object of the same name in the loaded workspace. 

## Work strategy - page 285



To save your workspace .RData file (also called workspace image):

- save.image("C:/Users/.../myproject.RData")
- or in Rstudio: Go to Session `\(\rightarrow\)` Save Work Space As...
- or, when you quit a RStudio session, you are asked whether you want to save your workspace

To load a (previsously saved) workspace:

- load("C:/Users/.../myproject.RData")
- in Rstudio: Go to Session `\(\rightarrow\)` Load Work Space...

Note: The instructions above are to save your workspace (all objects produced by your script). **It is not the same as saving your actual R script!** 

## Work stategy - Exercise

Which of the following R codes saves the workspace image as week_5 in the directory ```C:\Users\student\Documents\ACTL1101``` ?


```r
save.image("C:\Users\student\Documents\ACTL1101\week_5.rdata")
```


```r
save.image("C:/Users/student/Documents/ACTL1101/week_5")
```


```r
setwd("C:/Users/student/Documents/ACTL1101")
save.image(week_5.rdata)
```


```r
setwd("C:\\Users\\student\\Documents\\ACTL1101")
save.image("week_5.rdata")
```


## Work stategy - Solution

Which of the following R codes saves the workspace image as week_5 in the directory ```C:\Users\student\Documents\ACTL1101``` ?


```r
save.image("C:\Users\student\Documents\ACTL1101\week_5.rdata")
```
no, need to use ```\\``` or ```/```

```r
save.image("C:/Users/student/Documents/ACTL1101/week_5")
```
no, missing .rdata after week_5

```r
setwd("C:/Users/student/Documents/ACTL1101")
save.image(week_5.rdata)
```
no, forgot to put week_5.rdata between quotation marks ```""```

```r
setwd("C:\\Users\\student\\Documents\\ACTL1101")
save.image("week_5.rdata")
```
yes, full marks!




## Additional Notes

There are many other vector and matrix operations that you may find useful. You should revise the contents below and refer to the textbook for more details.

- inserting elements into vectors (see Pages 101-102), e.g.


```r
vecA <- c(1, 3, 6, 2, 7, 4, 8, 1, 0)
vecB <- c(vecA, 4, 1)
(vecC <- c(vecA[1:4], 8, 5, vecA[5:9]))
##  [1] 1 3 6 2 8 5 7 4 8 1 0
a <- c()
a <- c(a,2)
a
## [1] 2
```

- modifying the elements in a vector (see Page 101), e.g.


```r
z<-c(0,0,0,2,0)
z[c(1,5)] <- 1
z
## [1] 1 0 0 2 1
z[which.max(z)] <- 0
z
## [1] 1 0 0 0 1
z[z==0] <- 8
z
## [1] 1 8 8 8 1
```

- modifying elements of matrices (see Page 105), e.g. 


```r
m <- matrix(c(1,2,3,1,2,3,2,1,3),3,3)
m[m!=2] <- 0
m
##      [,1] [,2] [,3]
## [1,]    0    0    2
## [2,]    2    2    0
## [3,]    0    0    0

Mat <- matrix(1:12,nrow=4,byrow=TRUE)
Mat <- Mat[-4,]
Mat
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
## [3,]    7    8    9

m[Mat>7] <- Mat[Mat>7]
m
##      [,1] [,2] [,3]
## [1,]    0    0    2
## [2,]    2    2    0
## [3,]    0    8    9
```

- extracting elements from a list (see Pages 106-108)


```r
L <- list(cars=c("FORD","PEUGEOT"),climate=c("Tropical","Temperate"))
L[["cars"]]
## [1] "FORD"    "PEUGEOT"
L$cars
## [1] "FORD"    "PEUGEOT"
L$climate
## [1] "Tropical"  "Temperate"
```

Note that 

    - `\(L[2]\)` returns the second component of L as a list
    
    - `\(L[[2]]\)` returns the second component of L as an element 

- insering elements into a list (see Page 108)


```r
Mat <- matrix(1:12,nrow=4,byrow=TRUE)
L <- list(12,c(34,67,8),Mat,1:5,list(10,11))
L[2]
## [[1]]
## [1] 34 67  8
class(L[2])
## [1] "list"
L[c(3,4)]
## [[1]]
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
## [3,]    7    8    9
## [4,]   10   11   12
## 
## [[2]]
## [1] 1 2 3 4 5
L[[2]]
## [1] 34 67  8
class(L[[2]])
## [1] "numeric"
L[[5]][[2]]
## [1] 11
```

## Additional Notes - Manipulating character strings - Page 109


```r
(string <- c("one","two","three"))
## [1] "one"   "two"   "three"
as.character(1:3)
## [1] "1" "2" "3"
string1 <- c("a","B","bba","!")
nchar(string1)
## [1] 1 1 3 1
string1[nchar(string1)>2]
## [1] "bba"

string2 <- c("e","D")

paste(string1,string2)
## [1] "a e"   "B D"   "bba e" "! D"
paste(string1,string2,sep="-")
## [1] "a-e"   "B-D"   "bba-e" "!-D"
strsplit(c("05 Jan","06 Feb"), split=" ")
## [[1]]
## [1] "05"  "Jan"
## 
## [[2]]
## [1] "06"  "Feb"
```



## Relevant Exercises

- 5.1, 5.3 5.6 - 5.19, 9.1-9.8, 9.10-9.12

