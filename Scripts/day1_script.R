sin(pi)
format(sin(pi), digits=2)
round(sin(pi), digits = 2)
# this is a comment, it will be ignored
# don't worry too much about the next line
abs(sin(pi) - 0) < 1e-15

# tab completion
sqrt(10)

# functions in functions in functions
log2(sqrt(10))

# variables
a <- 10
a = 10 # don't do it like this!
log2(sqrt(a))

a <- 20
log2(sqrt(a))

a + 2
a <- "some stupid stuff"     
a
a + 20
a <- "20"
a + 20

as.numeric(a) + 20
# this works, but the result is "not available"
as.numeric("stupid stuff")

as.numeric("stupid stuff") * 20
NA * 20

e
pi
exp(1) # same as e to the power of 1

## -----------------------------------------
## ------------- VECTORIZATION -------------
## -----------------------------------------

a <- c(1, 2, 5) # make a vector of 3
sum(a) # calculate the sum of a vector 
length(a) # gives you the length of a vector

sum(a)/length(a) # the mean
mean(a)
sd(a) # standard deviation


# this gives a sequence of numbers
1:5
a <- 1:5
# this is a shorthand for
seq(1, 5) # sequence
seq(1, 5, .1)

# define the diameters
d <- c(1, 5, 13)

# formula for area of a circle
w <- (d/2)^2 * pi

# operator precedence
2 + 3^2 * 5
d/2 * pi^2

# we can put it all on one line
w <- pi / 4 * c(1, 5, 13)^2

d
d + 1
d * 2
sqrt(d)
log(d)
sin(d)

# this is not a vectorized function
mean(d)

# what happens if we add two vectors of the same length?
c(1, 2, 3) + c(10, 20, 30)

# BMI for two people
heights <- c(186, 197)
weights <- c(100, 85)
BMIs <- weights / (heights/100)^2
BMIs

# selecting elements
students <- c("Anna", "Bernie", "Claudia", "David")
students[1] # first student
students[1:3] # first three students
students[ c(1, 3, 2)]
students[ c(1, 1, 1)]
students[ c(3, 1)]
students[ -1 ]

sel <- 1:3
students[sel]

students[ c(-1, 2)] # this does not work
students[ c(-1, -3)] # this does
students[ -1:-3 ]
-1:-3

#factors: you don't need them yet, but you should know that they exist
teachers <- c("manuela", "january")
f_teachers <- factor(teachers)
as.numeric(f_teachers)
as.character(f_teachers)

# example of bad formatting
a <- 5

b <- c(1,10, 
       20, 21, 5)

r<-sqrt(sum((b-mean(b))^2)/a)
r

## Calculating the standard deviation of a sample

# example values for five samples
samples   <- c(1, 10, 20, 21, 5)
samples_n <- length(samples)

# calculate standard deviation of samples manually
samples_mean <- mean(samples)
samples_devs <- samples - samples_mean

# samples variance
samples_var  <- sum(samples_devs^2) / (samples_n - 1)

samples_sd   <- sqrt(samples_var)

# alternative: use the built-in function
samples_sd <- sd(samples)
