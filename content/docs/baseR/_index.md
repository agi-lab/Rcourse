---
title: 'Introduction to Base R'
---



# Introduction to Base R

## Learning outcomes

By the end of this Section, you should be able to

- perform basic calculations with R
- perform relational and logical operations in R
- define variables in R
- recognise and create data of different types in R

Note that page numbers refer to the book [The R Software](http://biostatisticien.eu/springeR/index-en.html).

## R is a calculator - page 38
	
R can easily replace all the functionalities of a (sophisticated!) calculator.


```r
sin(2*pi/3)     # <--- this symbol is for comments.
## [1] 0.8660254
5^2             # Same as 5*5.
## [1] 25
sqrt(4)         # Square root of 4.
## [1] 2
log(1)          # Natural logarithm of 1.
## [1] 0
c(1,2,3,4,5)    # Collection of the first 5 integers.
## [1] 1 2 3 4 5
c(1,2,3,4,5)*2  # First five even numbers.
## [1]  2  4  6  8 10
```


## Assignment operation - page 39

R responds to your requests by displaying the result obtained after evaluation. However, this result is displayed, then lost.
	
To store values, one can use the \assignment arrows: <- or ->.


```r
x <- 1 # Assignment.
x # Display.
## [1] 1
2 -> x # Assignment (in the other direction).
x # Display.
## [1] 2
(x <- 1) # Assignment AND display.
## [1] 1
```
		


## Continuation symbol - page 39
	
If a command is not complete at the end of a line, R will display a different prompt symbol, by default the plus sign `\(+\)`, on the second line and on following lines. R will wait for instructions until the command is syntactically complete.


```r
2*8*10+exp(1)
## [1] 162.7183

2*8*    # If you run only this line: R displays the '+' symbol and waits
10+exp( # Again, the command is not complete so R will display '+'
1)      # The command is complete, R displays the result
## [1] 162.7183
```


## Vectors - page 51

- Vectors are a very important type of **data structure** in R. We will see other types of data structures in Week 2, but for now we concentrate on vectors.

- A vector is a **sequence of data points** of the same type. 
	
- You can create a vector in different ways. For instance, the function c() produces a vector. 

- Operations performed on vectors are done **element by element**.


```r
c(1,2,3)
## [1] 1 2 3
c(1,2,3) + c(4,5,6)
## [1] 5 7 9
c(1,2,3) * c(4,5,6)
## [1]  4 10 18
```


- To produce a vector, you can also use function seq()


```r
seq(from=0, to=1, by=0.1)
##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
seq(from=0, to=20, length=5)
## [1]  0  5 10 15 20
```

- Or simply use the colon :


```r
vec <- 2:10
vec
## [1]  2  3  4  5  6  7  8  9 10
```



## Relational operations - Pages 97-98

You can perform relational operations in R, which will output logical values (TRUE/FALSE)


```r
# Striclty greater
2 < 3
## [1] TRUE
2 < 2
## [1] FALSE
# Greater or equal
2 <= 2
## [1] TRUE
# Equal  
1 == 1
## [1] TRUE
# Not equal
1 != 1
## [1] FALSE
# Equal, for vectors
c(1,2,3)==c(1,1,3)
## [1]  TRUE FALSE  TRUE
```

Note that in the last case, since two vectors are compared, three results are given, one for each individual relation.

## Logical operations - Pages 97-98

You can perform logical operations in R, which will output logical values. We start from the logical AND operators \& and \&\&

- The elementwise comparison \&
    - compares the first element of the first vector to the first element of the second vector, then the second element of the first vector to the second element of the second vector, and so on 
    - returns a vector of logical values


```r
c(2>1,4>2)&c(1>2,3>0)
## [1] FALSE  TRUE

# c(2>1,4>2) will give c(T,T)
# c(1>2,3>0) will give c(F,T)
# c(T,T)&c(F,T) will give c(F,T) since T&F is F and T&T is T
```

- The short-circuit evaluation \&\&
    - evaluates left to right examining only the first element of each vector
    - returns a **single** logical value
    - typically used in programming control-flows (more on this in Week 3)


```r
c(2>1,4>2)&&c(1>2,3>0)&&c(9>5,5>2)
## [1] FALSE

# only the first elements of each vector is considered
# hence it is equivalent to (2>1)&&(1>2)&&(9>5)
# since (2>1)&&(1>2) necessarily leads to F, (9>5) is not even considered
```


Same principles apply to the logical OR operators | and ||.



```r
any(c(T,F))
## [1] TRUE
all(c(T,F))
## [1] FALSE
```



## Variables in R - page 40

A variable is an object in R. There are rules for choosing a variable name:

- a variable name can only include alphanumerical characters, underscore (_) and the dot (.);
- variable names are case sensitive, which means that R distinguishes upper and lower case;
- a variable name may not include white space or start with a digit.

Note: use meaningful names for your variables to improve the readability of your codes.



## Data types - page 50

One of the main strengths of R is its ability to organise data in a structured way. This will turn out to be very useful for many statistical procedures.
	
|**Data type**                  | **Type in R**     | **Display**   |
|:------------------------------|:-------------     |:--------------|
| real number (integer or not)  |	numeric (double)  | 3.27          |
| integer                       |	numeric (integer) | 3             |
| complex number                | 	complex         | 3+2i          |
| logical (true/false)          |	logical           | TRUE or FALSE |
| missing                       |	logical           | NA            |
| text (string)                 |	character         | "text"        |

### Examples - pages 46-48
	

```r
a <- 1
typeof(a)
## [1] "double"
c <- as.integer(a)
typeof(c)
## [1] "integer"
b <- 3.4
c(b>a,a==b)
## [1]  TRUE FALSE
is.numeric(a)
## [1] TRUE
is.integer(a)
## [1] FALSE
x <- TRUE # same as: x <- T
is.logical(x)	
## [1] TRUE
```

### Missing data - pages 48-49 
A missing or undefined value is indicated by the instruction NA (for Non Available). 


```r
x <- c(3,NA,6)
is.na(x)
## [1] FALSE  TRUE FALSE
mean(x)
## [1] NA
mean(x,na.rm=TRUE)
## [1] 4.5
```

### Character strings - page 49

Any information between quotation marks (single '' or double "") corresponds to a character string. Try the following commands:


```r
a <- "R is my friend"
mode(a)
## [1] "character"
is.character(a)
## [1] TRUE
```

### Differences between typeof() and mode()

- mode() relies on the output of typeof
- mode() also allows you to set the type
- sometimes, mode may return different names of types (e.g. 'numeric' vs. 'double')
    - search for mode in the help window


## Relevant Exercises

- 3.1 - 3.13, 6.1, 6.5-6.7


## Comments on some examples of variable names
- delaytime

    - Confusing to read, it's good practice to separate words with dots "(.)" or 
    
    - Alternative(s): delayTime, delay.time

- the_number_of_marks_higher_than_50

    - Too long
    
    - Alternative: marks.passed
    
- 20_day_limit

    - Starts with a number
    
    - Alternative: twenty.day.limit
    
- child/adult

    - Can't have forward slash character "/"

    - Alternative(s): child.or.adult, child.adult

- pi

    - Already a specially defined constant (3.1415...)
    
    - Alternative: Depends on how the variable is used
    
- variable1

    - Not descriptive enough
    
    - Alternative: Something related to what the variable represents
