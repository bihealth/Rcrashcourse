# first, we define a sequence
a <- seq(1, 5, length.out = 20)

x <- rnorm(1000)
hist(x)
d <- density(x)
plot(d)
set.seed(123)
rnorm(1)
plot(x)
plot(sort(x))

# lists
person1 <- list(name="January Weiner", age=c(3, 1e3, 1e6), lastname="Weiner", worth=0)
person2 <- list(name="Bill Gates", age=119, lastname="Gates", worth=70e9)

printPerson <- function(person) {
  person$name <- "Jeff Bridges"
  print(person$lastname)
  print(sprintf("worth=%d", person$worth))
  }

name <- person[[1]]

counter <- 1

increaseCounter <- function(c=list(counter=1, name="test")) {
  print(c)
  c$counter <- c$counter + 1
  print(c)
  return(c)
}

newc <- increaseCounter() # initialize the counter
newc <- increaseCounter(newc)

x <- seq(1, 8, length.out=100)
y <- 1/100 * 2^(x-1)
plot(x, y, xlab="Days", ylab="Fraction of surface", type="l")
abline(h=.5)
abline(h=1)
locator(1)

#' Return the surface of the lake covered by water lilies
lakesurface <- function(days, initial=.01) {
  surface <- initial * 2^days
  return(surface)
}
  



## fibonacci series: 1 1 2 3 5 ...
## f(n) = f(n-1) + f(n-2)

fibonacci <- function(n) {
  
  if(n==1 || n==2) {
    print("n is either 1 or 2")
     return(1)
  }
  
  return(fibonacci(n-1) + fibonacci(n-2))
  
  
}

lfcs <- c(0.7, 1, 2, 1, 0, .3)
pvals <- c(.01, 0.7, 0.01, 1, 1, .0001)
lfcs > .5
pvals < .05

lfcs > .5 & pvals < .05
 


