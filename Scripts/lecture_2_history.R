library("ape", lib.loc="~/R/library")
detach("package:ape", unload=TRUE)
m <- matrix(1:18, ncol=3, nrow=6)
m
# compare with
m <- matrix(1:18, ncol=3, nrow=6, byrow=TRUE)
m
dim(m)
ncol(m)
nrow(m)
m[1, ]
m[ , 1]
m[ , c(1, 3)]
m[ , 1:2]
m[ , c(FALSE, TRUE, TRUE)]
m[ , 1]
m[1, ]
m[1, , drop=F]
m[1, , drop=FALSE]
m[1, , drop=TRUE]
dim(m[1, , drop=FALSE])
dim(m[1, , drop=TRUE])
nrow(m[1, , drop=TRUE])
as.matrix(m[1, , drop=TRUE])
matrix(1:5,)
m
colnames(m) <- letters[1:ncol(m)]
m
rownames(m) <- LETTERS[1:nrow(m)]
m
matrix(1:3, ncol=3, nrow=10)
matrix(1:4, ncol=3, nrow=10)
m[, 4]
m
v <- 1:10
v[11]
names <- c("January", "Bill")
lastn <- c("Weiner", "Gates")
age   <- c(1001, 64)
d <- data.frame(names=names, last_names=lastn, age=age)
d
dim(d)
ncol(d)
nrow(d)
class(d)
class(d[,1])
d[,1]
d[,2]
d[,3]
d[1,]
class(d[1,])
d <- list(names=names, last_names=lastn, age=age)
d
d <- data.frame(names=names, last_names=lastn, age=age)
d$names
d[["names"]]
d[ , 1]
d[ , 1, drop=FALSE]
d[ , 1]
d[ , 1, drop=FALSE]
d
d
d$names
d$os <- c("Ubuntu", "MacOS")
d
d$os <- c("Ubuntu", "MacOS", "Windows")
d$os <- c("Ubuntu")
d
d2 <- data.frame(id=1:4)
d2
d2$value <- c(1,2)
d
d2
d2$value <- c(1,2,3)
d <- data.frame(value=rnorm(10))
d
d$group <- rep(c("A", "B"), 5)
d
rep(1:3, 5)
d$group <- rep(c("A", "B"), each=5)
d
"A", "B"
rep(c("A", "B"), 5)
rep(c("A", "B"), each=5)
m <- matrix(rnorm(15), nrow=5, ncol=3)
m
rnorm(10, mean = 10, sd = .1)
m <- matrix(0, nrow=5, ncol=3)
m
t(m)
d <- as.data.frame(m)
d
class(d)
colnames(m) <- c("First column", "Column 2", "col III")
m
m[ , "Column 2"]
d
colnames(d) <- c("First column", "Column 2", "col III")
d$First column
d$First + column
d$"First column"
View(d)
View(m)
m
rbind(m, c(1, 2, 3))
rbind(m, m)
m <- matrix(rnorm(15), ncol=5)
m
m1 <- matrix(0, ncol=3, nrow=4)
m1
m
rbind(m1, m)
m <- matrix(rnorm(15), ncol=3)
rbind(m, m1)
d
rbind(d, m)
m
colnames(m) <- colnames(d)
rbind(d, m)
d
d$label <- "foo"
d
newrow <- dataframe(1, 1, 1, "bar")
newrow <- data.frame(1, 1, 1, "bar")
newrow
colnames(newrow) <- colnames(d)
newrow
rbind(d, newrow)
d
d$sequence <- seq(1, nrow(d))
d$sequence <- 1:nrow(d)
d
d[1, ]
paste("A", 1:5)
paste("ID", 1:5)
paste("ID", 1:5, sep="_")
rownames(d) <- paste("ID", 1:5, sep="_")
d
d[ "ID_1", ]
read.table("../Rcrashcourse/Datasets/iris.csv")
read.table("../Rcrashcourse/Datasets/iris.tsv")
head(read.table("../Rcrashcourse/Datasets/iris.tsv"))
head(read.table("../Rcrashcourse/Datasets/iris.tsv", header=F))
head(read.table("../Rcrashcourse/Datasets/iris.tsv", header=F))
foo <- read.table("../Rcrashcourse/Datasets/iris.tsv", header=F)
head(foo)
foo$V1
class(foo$V1)
class(foo$V2)
class(foo$V3)
foo$V3
foo <- read.table("../Rcrashcourse/Datasets/iris.tsv", header=T)
head(foo)
class(foo[,2])
summary(foo[,2])
foo$Species
foo <- read.csv("../Rcrashcourse/Datasets/iris.csv")
head(foo)
foo <- read.csv("../Rcrashcourse/Datasets/iris.csv")
head(foo)
load("~/Private/Uczycielstwo/BIH/basic_course_2020/Rcrashcourse/Datasets/iris.csv")
foo <- read.csv("../Rcrashcourse/Datasets/iris.csv")
foo
head(foo)
class(foo$Sepal.Length)
class(foo$Sepal.Length)
class(foo$Sepal.Width)
foo$Sepal.Width
as.numeric(foo$Sepal.Width)
is.na(as.numeric(foo$Sepal.Width))
which(is.na(as.numeric(foo$Sepal.Width)))
foo[ 42, ]
sessionInfo()
foo[ 42, ]
foo[ 42, 3]
foo[ 42, 3] <- 2.3
foo[,3]
class(foo$Sepal.Width)
foo$Sepal.Width <- as.numeric(foo$Sepal.Width)
class(foo$Sepal.Width)
foo <- read.csv("../Rcrashcourse/Datasets/iris.csv", stringAsFactors=TRUE)
foo <- read.csv("../Rcrashcourse/Datasets/iris.csv", stringsAsFactors=TRUE)
foo$Sepal.Width
as.numeric(foo$Sepal.Width)
testf <- factor(c("a", "b", "c"))
testf
as.numeric(testf)
as.numeric(foo$Sepal.Width)
foo$Sepal.Width
foo <- read.csv("../Rcrashcourse/Datasets/iris.csv", stringsAsFactors=FALSE)
foo$Sepal.Width
foo[42, 3]
foo$Sepal.Width <- gsub(",", ".", foo$Sepal.Width)
group <- c("Control", " control", "control ", "Control   ")
group <- gsub("Control", "control", group)
group
gsub("control", "susan", group)
group <- gsub("control", "susan", c("controlcontrol", "controlcontrolcontrol"))
group
group <- sub("control", "susan", c("controlcontrol", "controlcontrolcontrol"))
group
group <- gsub("Control", "control", group)
group <- c("Control", " control", "control ", "Control   ")
group <- gsub("Control", "control", group)
group
unique(group)
foo
unique(foo$Species)
summary(factor(foo$Species)
)
class(foo$Species)
group <- c("Control", " control", "control ", "Control   ")
group <- gsub("Control", "control", group)
group <- gsub(" ", "", group)
group
unique(group)
gsub("c", "X", "bcbcbcbcbcbc")
gsub("c$", "X", "bcbcbcbcbcbc")
gsub("_.*$", "", "ID1231_8238")
library(readxl)
foo <- read_xlsx("../Rcrashcourse/Datasets/metabolic_modules.xlsx")
foo <- read_xlsx("../Rcrashcourse/Datasets/metabolic_modules.xlsx")
foo
foo <- as.data.frame(read_xlsx("../Rcrashcourse/Datasets/metabolic_modules.xlsx"))
head(foo)
class(foo$Pathway)
foo <- as.data.frame(read_xlsx("../Rcrashcourse/Datasets/metabolic_modules.xlsx"), stringsAsFactors=F)
foo <- as.data.frame(read_xlsx("../Rcrashcourse/Datasets/metabolic_modules.xlsx"), stringsAsFactors=T)
class(foo$Pathway)
foo <- as.data.frame(read_xlsx("../Rcrashcourse/Datasets/metabolic_modules.xlsx"))
foo <- read_xlsx("../Rcrashcourse/Datasets/metabolic_modules.xlsx")
foo[,1]
rownames(foo)
rownames(foo) <- paste0("foo", rownames(foo))
foo <- as.data.frame(read_xlsx("../Rcrashcourse/Datasets/metabolic_modules.xlsx"))
apply(foo, 1, class)
apply(foo, 2, class)
foo <- as.data.frame(read_xlsx("../Rcrashcourse/Datasets/metabolic_modules.xlsx", sheet = 2))
foo
foo <- read.csv("../Rcrashcourse/Datasets/iris.csv", stringsAsFactors=FALSE)
foo[42,3]
foo$Sepal.Width <- gsub(",", ".", foo$Sepal.Width)
foo$Sepal.Width <- as.numeric(gsub(",", ".", foo$Sepal.Width))
class(foo$Sepal.Width)
summary(foo$Sepal.Width)
as.numeric(foo)
data.matrix(foo)
foo <- read_xlsx("../Rcrashcourse/Datasets/expression_data_vaccination_example.xlsx", sheet = 3)
excel_sheets("../Rcrashcourse/Datasets/expression_data_vaccination_example.xlsx")
foo <- read.csv("../Rcrashcourse/Datasets/iris.csv", stringsAsFactors=FALSE)
foo$Sepal.Width <- as.numeric(foo$Sepal.Width)
which(is.na(foo))
which(is.na(foo), arr.ind = TRUE)
foo[42,]
savehistory()
v <- c(rnorm(10), NA)
v
summary(v)
mean(v)
mean(v, na.rm = T)
sd(v, na.rm = T)
var(v, na.rm = T)
cor(v, v, use = "pair")
cor(v, v)
v <- 1:20
v
v[7]
v[-7]
v[-c(1,3,7)]
d
d[ , -1]
d$label
which(colnames(d) == "label")
-which(colnames(d) == "label")
d[, -which(colnames(d) == "label")]
d[, -which(colnames(d) %in% c("label", "sequence"))]
colnames(d) %in% c("label", "sequence")
d
which(colnames(d) %in% c("label", "sequence"))
-which(colnames(d) %in% c("label", "sequence"))
d[ , -which(colnames(d) %in% c("label", "sequence"))]
d[ , -colnames(d) %in% c("label", "sequence")]
d[ , colnames(d) %in% c("label", "sequence")]
d[ , !colnames(d) %in% c("label", "sequence")]
readxl_example("deaths.xls")
foo <- read_xlsx(readxl_example("deaths.xls"))
foo <- read_xlsx(readxl_example("deaths.xls"))
foo <- read_xlsx(path =  readxl_example("deaths.xls"))
library(readxl)
readxl_example("deaths.xls")
foo <- read_xls(path =  readxl_example("deaths.xls"))
foo
?read_xls
foo <- read_xls(path =  readxl_example("deaths.xls"), skip=3)
foo
foo <- read_xls(path =  readxl_example("deaths.xls"), skip=4)
foo
foo <- read_xls(path =  readxl_example("deaths.xls"), skip=4, n_max=10)
foo
as.data.frame(foo)
class(as.data.frame(foo)[,6])
foo <- read_xls(path =  readxl_example("deaths.xls"), col_types=c(rep("guess", 4), "date", "date"))
foo
foo <- read_xls(path =  readxl_example("deaths.xls"), col_types=c(rep("guess", 3), "logical", "date", "date"))
foo
wide <- read.table(header=TRUE, text='
subject sex control cond1 cond2
1   M     7.9  12.3  10.7
2   F     6.3  10.6  11.1
3   F     9.5  13.1  13.8
4   M    11.5  13.4  12.9
')
wide
tidyr::gather(wide, key="condition",
value="measurement",  control:cond2)
value="measurement",  control:cond2)
tidyr::gather(wide, key="condition",
value="measurement",  control:cond2)
long <- read.table(header=TRUE, text='
subject  sampleID sex condition measurement
1  ID000001 M   control         7.9
1  ID000002 M     cond1        12.3
1  ID000003 M     cond2        10.7
2  ID000004 F   control         6.3
2  ID000005 F     cond1        10.6
2  ID000006 F     cond2        11.1
3  ID000007 F   control         9.5
3  ID000008 F     cond1        13.1
3  ID000009 F     cond2        13.8
')
long
## not what we wanted!!!
tidyr::spread(long, key="condition", value="measurement")
tidyr::spread(long, key="condition", value="measurement")
long
tidyr::spread(long, key="condition", value="measurement")
long <- long[, -2]
long
tidyr::spread(long, key="condition", value="measurement")
long <- read.table(header=TRUE, text='
subject  sampleID sex condition measurement
1  ID000001 M   control         7.9
1  ID000002 M     cond1        12.3
1  ID000003 M     cond2        10.7
2  ID000004 F   control         6.3
2  ID000005 F     cond1        10.6
2  ID000006 F     cond2        11.1
3  ID000007 F   control         9.5
3  ID000008 F     cond1        13.1
3  ID000009 F     cond2        13.8
')
tidyr::spread(long, key="condition", value="measurement")
wide
wide <- tidyr::gather(wide, key="condition", value="measurement", 3:5)
wide
long <- read.table(header=TRUE, text='
subject  sampleID sex condition measurement
1  ID000001 M   control         7.9
1  ID000002 M     cond1        12.3
1  ID000003 M     cond2        10.7
2  ID000004 F   control         6.3
2  ID000005 F     cond1        10.6
2  ID000006 F     cond2        11.1
3  ID000007 F   control         9.5
3  ID000008 F     cond1        13.1
3  ID000009 F     cond2        13.8
')
long
long <- long[ , -2]
long
wide <- tidyr::spread(long, )
library(tidyr)
wide <- spread(long, key = "condition", value="measurement")
wide
gather(wide, key="condition", value="measurement", 3:5)
savehistory()
