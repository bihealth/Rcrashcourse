plot(1:10)
x <- rbinom(1000)
x <- rbinom(1000, size=10)
x <- rbinom(1000, size=10, prob=.5)
hist(x)
plot(density(x))
śćółż <- 5
śćółż_123123 <- 5
x = 10
5 -> sadgfasd
a <- b <- 5
x <- rbinom(1000, prob=.5, size=10)
x
a <- "asdfasd asd asd"
a <- 1.2
a <- 6
class(a)
str(a)
str(x)
xy <- c(1, 5)
xy * 2
xy * 2 + 6
xy + xy
for(i in 1:2) xy[i] * 2
xy * 2
xy[1]
xy
xy[2]
x
x[1:5]
1:5
x[c(1, 2, 3, 4, 5)]
x[1:5]
newvector <- c("a", "b", "c")
newvector
str(newvector)
class(newvector)
newvector <- c(a, "b", "c")
a
newvector <- c(a, "b", "c")
newvector
newvector <- c(a, 6, 7)
newvector
newvector <- c(a, "b", "c")
newvector * 2
as.numeric(newvector)
newvector <- c(a, "1e-6", "c")
as.numeric(newvector)
is.na(NA)
is.na(newvector)
newvector <- as.numeric(newvector)
newvector
is.na(newvector)
any(is.na(newvector))
foo <- TRUE
foo <- T
FOO
foo
T <- 2137
foo <- T
foo
sum(is.na(newvector))
sum(c(1, 5, 7))
sum(is.na(c(1, 5, 7, NA, NA)))
pvals <- c(.5, .006, 1e-5, 0.059, .076, .0001, .0049)
pvals
pvals < .05
sum(pvals < .05)
sum(c("1", "b", "8"))
letters
Letters
LETTERS
c("a", "b", "C") %in% letters
group <- c("Patient", "Control", "control", "Patient ", "Patient")
all(group %in% c("Patient", "Control"))
which(group %in% c("Patient", "Control"))
!TRUE
!FALSE
group %in% c("Patient", "Control")
!group %in% c("Patient", "Control")
sum(!group %in% c("Patient", "Control"))
which(!group %in% c("Patient", "Control"))
group <- c("Patient", "Control", "Control", "Patient ", "Patient")
group <- factor(group)
class(group)
str(group)
group
levels(group)
group <- c("Patient", "Control", "Control", "Patient", "Patient")
group <- factor(group)
levels(group)
as.numeric(group)
summary(group)
x <- c(1:100)/100 * pi
x
y <- sin(x)
plot(x, y)
x <- c(1:100)/100 * 2 * pi
y <- sin(x)
plot(x, y)
?sin
??normal
sin(pi)
sin(pi) == 0
pi
asin(1)
asin(0)
acos(1)
acos(0)
acos(0) * 2
format(acos(0) * 2, digits=15)
format(pi, digits=30)
format(pi, digits=15)
format(pi, digits=16)
format(pi, digits=24)
format(pi, digits=20)
a <- 1/3
a * 3
sin(pi)
(sin(pi) - 0) < 1e-12
sin(pi):100
as.integer(sin(pi):100)
seq(1, 5, by=.2)
seq(1, 5, length.out = 20)
length(seq(1, 5, length.out = 20)
)
#asdf asdf asdf
# first, we define a sequence
a <- seq(1, 5, length.out = 20)
x <- rnorm(1000)
hist(x)
d <- density(x)
d
class(d)
plot(d)
set.seed(123)
rnorm(1)
rnorm(1)
set.seed(123)
rnorm(1)
plot(x)
x <- rnorm(5)
x
plot(x)
d$x
plot(d$x, d$y)
plot(sort(x))
x <- rnorm(1000)
plot(sort(x))
# lists
person <- list(name="January Weiner", age=c(3, 1e3, 1e6))
a <- 1
person
person$name
person$age
person[1]
name <- person[1]
name
name$name
name <- person[[1]]
name
# lists
person <- list(name="January Weiner", age=c(3, 1e3, 1e6), lastname="Weiner")
person[c(1,2)]
{ 1 + 2 ; a <- 11 }
a
printPerson <- function(person) {
print(person1$lastname)
print(sprintf("worth=%d", worth))
}
person2 <- list(name="Bill Gates", age=119, lastname="Gates", worth=70e9)
# lists
person1 <- list(name="January Weiner", age=c(3, 1e3, 1e6), lastname="Weiner", worth=0)
printPerson(person=person1)
print(person$lastname)
printPerson <- function(person) {
print(person$lastname)
print(sprintf("worth=%d", person$worth))
}
printPerson(person1)
printPerson <- function(person) {
person$name <- "Jeff Bridges"
print(person$lastname)
print(sprintf("worth=%d", person$worth))
}
printPerson(person1)
person1
counter <- 1
increaseCounter <- function(c) {
c <- c + 1
}
increaseCounter(counter)
counter
counter <- 7
increaseCounter(counter)
counter
increaseCounter <- function(c) {
print(c)
c <- c + 1
print(c)
}
increaseCounter(counter)
counter
increaseCounter <- function(c) {
print(c)
c <- c + 1
print(c)
return(c)
}
counter
counter <- increaseCounter(counter)
counter
increaseCounter <- function(c) {
print(c)
c <- c + 1
print(c)
return(c, "test")
}
counter <- increaseCounter(counter)
increaseCounter <- function(c=1) {
print(c)
c$counter <- c$counterc + 1
print(c)
return(list(counter=c, counterName="test"))
}
increaseCounter <- function(c=list(counter=1, name="test")) {
print(c)
c$counter <- c$counterc + 1
print(c)
return(c)
}
increaseCounter()
increaseCounter <- function(c=list(counter=1, name="test")) {
print(c)
c$counter <- c$counter + 1
print(c)
return(c)
}
increaseCounter()
newc <- increaseCounter()
newc
newc <- increaseCounter(newc)
newc
days <- 1:10
x <- 1:10
y <- 1/100 * 2^(x-1)
plot(x, y, xlab="Days", ylab="Fraction of surface")
abline(h=.5)
abline(h=1)
x <- seq(1, 8, length.out=100)
x
y <- 1/100 * 2^(x-1)
plot(x, y, xlab="Days", ylab="Fraction of surface")
plot(x, y, xlab="Days", ylab="Fraction of surface", type="l")
abline(h=.5)
abline(h=1)
locator(1)
#' Return the surface of the lake covered by water lilies
lakesurface <- function(days, initial=.01) {
return(initial * 2^days)
}
plot(1:10, lakesurface(1:10))
fibonacci <- function(n) {
if(n==1 | n==2) return(1)
return(fibonacci(n-1) + fibonacci(n-2))
}
fibonacci(5)
fibonacci(6)
fibonacci(7)
fibonacci <- function(n) {
if(n==1 | n==2) {
print("n is either 1 or 2")
return(1)
}
return(fibonacci(n-1) + fibonacci(n-2))
}
fibonacci(7)
fibonacci <- function(n) {
if(n==1 || n==2) {
print("n is either 1 or 2")
return(1)
}
return(fibonacci(n-1) + fibonacci(n-2))
}
TRUE || FALSE
TRUE || TRUE
FALSE || FALSE
TRUE && FALSE
TRUE && TRUE
c(TRUE, FALSE) && c(TRUE, TRUE)
lfcs <- c(0.7, 1, 2, 1, 0, 0)
pvals <- c(.05, 0.7, 0.01, 1, 1, 1)
lfcs > 1
lfcs > .5
pvals <- c(.01, 0.7, 0.01, 1, 1, 1)
lfcs > .5
pvals < .05
pvals <- c(.01, 0.7, 0.01, 1, 1, .0001)
lfcs <- c(0.7, 1, 2, 1, 0, .3)
lfcs > .5
pvals < .05
lfcs > .5 & pvals < .05
install.packages("tmod")
library(tmod)
library("tmod")
library
require
myfuncs::c
rnorm(10)
rnorm(10)
plot(cars)
x <- seq(1, 8, length.out=200)
y <- .01 * 2 ^ x
plot(x, y, type="l")
zz()
