person <- c("January", "Weiner", 134)
person
names(person) <- c("First name", "Second name", "Age") 
person
person[1] # first name
person[ "First name" ]
person[ "First Name" ] # this does not work, labels are case sensitive

# vectors can have only one data type
age <- c(27, 35, "56?")
age 
age * 365

# some other special values
1 / 0
-1 / 0
0 / 0
a <- 1 / 0
a
a * -1 
a / a
weird_vector <- c(NaN, NA, Inf, -Inf, 42)
weird_vector
iris
head(iris)
head(iris, 5)
head(iris, Inf)
5 < Inf

# Logical vectors
sel <- c(TRUE, FALSE, FALSE, TRUE)
sum(sel)
pvals <- c(0.7, 1.0, 0.001, 0.05, 0.04)
significant <- pvals < 0.05
sum(significant)

# select pvals which are smaller than 0.05
pvals[ significant ]

# pvals that are larger than 0.05
pvals[ pvals > 0.05 ]
pvals[ pvals >= 0.05 ]

# watch out for equality!!
# this does not always work bc computers do not have infinite precision
sin(pi) == 0

persons <- c("Arthur", "Ford Prefect", "Douglas")
persons == "Arthur"
# which takes a logical vector
which(persons == "Arthur")
persons[ persons == "Arthur" ]

# following does not work b/c we don't have names for the vector
persons[ "Arthur" ]
names(persons)

names(persons) <- c("Dent", "Prefect", "Adams")
persons


# exercise logical vector
vec <- rnorm(50)
plot(hist(vec))
hist(rnorm(10000))

vec05 <- vec[ vec > 0.5 ]
vec05
vec0510 <- vec05[ vec05 < 1 ]

# we can do it in one go using &
TRUE & FALSE
TRUE & TRUE
FALSE & FALSE
c(TRUE, FALSE, FALSE) & c(TRUE, FALSE, TRUE)
vec[ vec > 0.5 & vec < 1.0 ]
vec0510

# we can also use the OR operator - |
TRUE | FALSE
FALSE | FALSE
TRUE | TRUE
vec[ vec < -1 | vec > 1 ]
# however, this can be done differently
vec[ abs(vec) > 1 ]
abs(c(-1, 2, -3))

greater_than_05 <- vec > 0.5
greater_than_05
sum(greater_than_05)
which(greater_than_05)

sel05 <- vec > 0.5
sel1 <- vec < 1.0
sel05
sel1
sel05 == sel1 # this is not the way to go
sel05 & sel1

a != b # same as:
! (a == b)


# exercise 2.1
samples <- c(1, 10, NA, 15)

# we want to replace all NAs with something

samples[1] <- 50
samples
samples[ is.na(samples) ] <- 99
samples

# rep and paste
vec <- c("A", "B")
rep(vec, 5)
rep(vec, each=5)

paste("A", "B", "C")
paste("A", "B", "C", sep=";")
paste("A", "B", "C", sep="")
paste0("A", "B", "C")

a <- c("A", "B", "C")
b <- c("1", "2", "3")
paste0(a, b)

a <- rep(c("A", "B", "C"), each = 3)
b <- rep(c("1", "2", "3"), 3)
paste0(a, b)

# complex data types
m <- matrix(1:18, ncol=3, nrow=6)
m

# compare with
m <- matrix(1:18, ncol=3, nrow=6, byrow=TRUE)
m

m[ 2, 2 ]
m[ 1, 2 ]
m[ 6, 3 ]
m[ 6, 6 ]
m
m[ 1:2, 1:2 ]
m[ c(1, 5), c(1, 3)]
m

m[ 1, ] # get the first row
m[ , 1 ] # get the first column

dim(m)
ncol(m)
nrow(m)

colnames(m) <- c("A", "B", "C")
letters
LETTERS
letters[1:3]
colnames(m) <- LETTERS[1:3]
rownames(m) <- LETTERS[1:6]
m
m[ "A", "C"]
m[ c("A", "D"), "B"]
m
class(m)
typeof(m)
is.numeric(m)
m[ 2, 3 ] <- "foobar"
m
class(m)
typeof(m)
is.numeric(m)

# exercise 2.2
drugs <- matrix(rnorm(48), ncol=8)
rownames(drugs) # NULL - no rownames at first
dim(drugs)
drugs
drugs[c(1, nrow(drugs)), ] <- NA
drugs[ , c(1, ncol(drugs))] <- NA

row_treat <- paste("Inh1", c("C", "L", "M", "H"), sep="_")
row_treat
rownames(drugs) <- c("FirstRow", row_treat, "SecRow")
# rownames(drugs) <- c(NA, row_treat, NA)
# Alternative:
rownames(drugs) <- paste0("R", 1:6)
rownames(drugs)[2:5] <- row_treat

# wrong:
# X! col_treat <- paste(c("Inh2", "Inh3"), c("C", "L", "H"), sep="_")

col_inh <- rep(c("Inh2", "Inh3"), each=3)
col_conc <- rep(c("C", "L", "H"), 2)
col_treat <- paste(col_inh, col_conc, sep="_")
colnames(drugs) <- c("C1", col_treat, "CL")

drugs[ 2:5, which(col_inh == "Inh3") + 1 ]

# lists
person <- list(name="Weiner", 
               Age=NA, 
               lucky_nums = runif(4),
               given="January",
               drug_mtx=drugs)
person
person[["lucky_nums"]]
person[[3]]
person$lucky_nums

person["lucky_nums"]
person[c(FALSE, FALSE, TRUE, FALSE, FALSE)]
is.list(person["lucky_nums"])
is.list(person[["lucky_nums"]])

person$city
person$city <- "Berlin"
person$city
person$lucky_nums <- NULL # remove the element from the list
person$lucky_nums

myvec <- 1:5
myvec
myvec[ c(1, 5) ] <- myvec[ c(5, 1) ]
myvec # is now 5, 2, 3, 4, 1
length(person)
names(person)
person <- person[ c("name", "given", "city", "Age", "drug_mtx") ]
names(person)

# data frames
names <- c("January", "Manuela", "Bill")
lastn <- c("Weiner", "Benary", "Gates")
age   <- c(1001, NA, 65)

d <- data.frame(names=names, last_names=lastn, age=age)

# this works like for lists:
d$age
d[["age"]]
d[1:2, ] # this works like for matrices
d[, 1:2]
colnames(d)
colnames(d) <- c("imie", "nazwisko", "wiek")

d$city <- c("Berlin", "Hoppegarten", "Seattle")

# a simple t.test
group1 <- rnorm(20, mean = -1)
group2 <- rnorm(20, mean = 1)
boxplot(group1, group2)
ttest_results <- t.test(group1, group2)
ttest_results$p.value

iris
class(iris)

# converting to a data frame
drugs
class(drugs)
drugs_df <- as.data.frame(drugs)
drugs_df$C1 <- "Border"

# what will happen now?
drugs_df$Inh2_C[1] <- "Border"
drugs_df$Inh2_C
