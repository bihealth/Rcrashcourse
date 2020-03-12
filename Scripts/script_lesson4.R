targets <- read_xlsx("Datasets/expression_data_vaccination_example.xlsx",
sheet=1)
library(readxl)
targets <- read_xlsx("Datasets/expression_data_vaccination_example.xlsx",
sheet=1)
head(targets)
lab <- read.csv("Datasets/labresults_full.csv")
head(lab)
targets <- targets[ , c("USUBJID", "Timepoint", "ARM", "SEX", "AGE") ]
head(targets)
lab <- lab[ ,
c("USUBJID", "LBTEST", "LBTESTCD", "LBORRES", "Timepoint") ]
head(lab)
## remove the "SCREEN" time point
lab <- lab[ lab$Timepoint != "SCREEN", ]
## not what we want!
merged <- merge(targets, lab, by="USUBJID")
head(merged)
with(merged, merged[ USUBJID == "CRC305A-7012-105" & Timepoint.x == "D0" & LBTESTCD == "CRP", ]
)
with(merged, merged[ USUBJID == "CRC305A-7012-105" & Timepoint.x == "D1" & LBTESTCD == "CRP", ])
## this one drops all timepoints not present in "targets"
merged <- merge(targets, lab, by=c("USUBJID", "Timepoint"))
with(merged, merged[ USUBJID == "CRC305A-7012-105" & Timepoint.x == "D1" & LBTESTCD == "CRP", ])
with(merged, merged[ USUBJID == "CRC305A-7012-105" & LBTESTCD == "CRP", ])
## to keep all time points
targets2 <- targets[ , c("USUBJID", "ARM", "SEX", "AGE") ]
head(targets2)
merged <- merge(targets, lab, by=c("USUBJID", "Timepoint"), all.y=TRUE)
head(merged)
duplicated(c(1, 1, 2, 3, 2, 3, 4))
!duplicated(c(1, 1, 2, 3, 2, 3, 4))
c(1, 1, 2, 3, 2, 3, 4)[ !duplicated(c(1, 1, 2, 3, 2, 3, 4)) ]
targets <- read_xlsx("Datasets/expression_data_vaccination_example.xlsx",
sheet=1)
targets <- targets[ , c("USUBJID", "Timepoint", "ARM", "SEX", "AGE") ]
## to keep all time points
targets2 <- targets[ , c("USUBJID", "ARM", "SEX", "AGE") ]
## remove duplicated lines
targets2 <- targets2[ !duplicated(targets2$USUBJID), ]
nrow(targets)
nrow(targets2)
## merge
merged_full <- merge(targets2, lab, by="USUBJID")
nrow(merged_full)
## this one drops all timepoints not present in "targets"
merged <- merge(targets, lab, by=c("USUBJID", "Timepoint"))
nrow(merged)
df1 <- data.frame(ID=c("a", "a", "b"), value1=rnorm(3))
df1
df2 <- data.frame(ID=c("a", "b", "c"), value1=rnorm(3))
df2
merge(df1, df2, by="ID")
any(duplicated(df1$ID))
labwide <- spread(merged, key="LBTESTCD", value="LBORRES")
library(tidyr)
labwide <- spread(merged, key="LBTESTCD", value="LBORRES")
head(labwide)
labwide <- spread(merged[, -6], key="LBTESTCD", value="LBORRES")
head(labwide)
head(lab)
sapply(labwide, class)
labwide2 <- data.frame(labwide[,1:5], data.matrix(labwide[,6:36]))
is.na(labwide2)
which(is.na(labwide2), arr.ind = T)
which(is.na(labwide2), arr.ind = T)[,2]
labwide[,17]
which(is.na(labwide2), arr.ind = T)[,2]
labwide[,16]
labwide[,22]
which(is.na(labwide2), arr.ind = T)[,2]
labwide[,14]
?data.matrix
head(labwide)
startpos <- which(colnames(labwide) == "ACA")
startpos
labwide2 <- data.frame(labwide[,1:(startpos-1)], data.matrix(labwide[,startpos:ncol(labwide)]))
## impute low measurements
labwide[,14] <- gsub("<", "", labwide[,14])
labwide[,16] <- gsub("<", "", labwide[,16])
## these column is all NA
labwide <- labwide[,-17]
labwide <- data.frame(labwide[,1:5], data.matrix(labwide[,6:35]))
which(is.na(labwide), arr.ind = T)[,2]
labwide[,21]
labwide[,28]
labwide[,21]
labwide$NEUT
mean(labwide$NEUT)
sd(labwide$NEUT)
hist(labwide$NEUT)
labwide$ARM
tapply(labwide$NEUT, labwide$ARM, mean)
mean(labwide$NEUT[ labwide$ARM == "FLUAD"])
mean.sd(x) { c(mean(x), sd(x)) }
mean.sd <- function(x) { c(mean(x), sd(x)) }
mean.sd(labwide$NEUT)
tapply(labwide$NEUT, labwide$ARM, mean.sd)
simplify2array(tapply(labwide$NEUT, labwide$ARM, mean.sd))
tapply(labwide$NEUT, labwide$Timepoint, mean)
tapply(labwide$NEUT,
paste(labwide$ARM, labwide$Timepoint, sep="."), mean)
paste(labwide$ARM, labwide$Timepoint, sep="."), sd)
tapply(labwide$NEUT,  paste(labwide$ARM, labwide$Timepoint, sep="."), mean)
tapply(labwide$NEUT,  paste(labwide$ARM, labwide$Timepoint, sep="."), sd)
fluad <- labwide$ARM == "FLUAD"
agrippal <- labwide$ARM == "AGRIPPAL"
d0 <- labwide$Timepoint == "D0"
d1 <- labwide$Timepoint == "D1"
x <- labwide$NEUT
fluad
x[fluad]
x[fluad & d0]
x[fluad & d1]
x[fluad & d1] - x[fluad & d0]
tst <- "NEUT" # lymphocyte count
x <- labwide[ ,tst]
x
x[fluad & d1] - x[fluad & d0]
t.test(x[d0 & fluad], x[d1 & fluad])
t.test(x[d0 & fluad], x[d1 & fluad], paired=TRUE)
all(labwide$USUBJID[d0] == labwide$USUBJID[d1])
head(labwide)
labwide$USUBJID[d0]
labwide$USUBJID[d1]
labwide$USUBJID[d0] == labwide$USUBJID[d1]
all(labwide$USUBJID[d0] == labwide$USUBJID[d1])
any(labwide$USUBJID[d0] != labwide$USUBJID[d1])
t.test(x[d0 & fluad], x[d1 & fluad], paired=TRUE)
t.test(rank(x)[d0 & fluad], rank(x)[d1 & fluad], paired=TRUE)
wilcox.test(rank(x)[d0 & fluad], rank(x)[d1 & fluad], paired=TRUE)
armcd <- gsub("(.).*", "\\1", labwide$ARM)
group <- paste(armcd, labwide$Timepoint, sep=".")
x <- labwide[ , tst]
tst
armcd
group
boxplot(x ~ group)
boxplot(x ~ group)
beeswarm(x ~ group)
library(beeswarm)
beeswarm(x ~ group)
x11()
beeswarm(x ~ group)
beeswarm(x ~ group)
??violin
boxplot(x[fluad] ~ group[fluad])
boxplot(x[fluad] ~ group[fluad], xlab="Group")
boxplot(x[fluad] ~ group[fluad], xlab="Group", ylab="Neutrophil count")
beeswarm(x[fluad] ~ group[fluad], add=TRUE)
boxplot(x ~ group, xlab="Group", ylab="Neutrophil count")
beeswarm(x ~ group, add=TRUE)
boxplot(x ~ group, xlab="Group", ylab="Neutrophil count")
beeswarm(x ~ group, add=TRUE, pch=19, col="grey")
boxplot(x[d0] ~ group[d0], xlab="Group", ylab="Neutrophil count")
beeswarm(x[d0] ~ group[d0], add=TRUE, pch=19, col="grey")
boxplot(x[d0] ~ group[d0], xlab="Group", ylab="Neutrophil count", main="Neutrophil count")
?boxplot
boxplot(x[d0] ~ group[d0], xlab="Group", ylab="Neutrophil count", main="Neutrophil count", horizontal=TRUE)
beeswarm(x[d0] ~ group[d0], add=TRUE, pch=19, col="grey")
beeswarm(x[d0] ~ group[d0], add=TRUE, pch=19, col="grey", horizontal=T)
showgene
boxplot(x[d0] ~ group[d0], xlab="Group", ylab="Neutrophil count", main="Neutrophil count", frame=FALSE)
x <- as.numeric(factor(group))
x
group
table(x, group)
y <- labwide[ , tst]
y
x11()
plot(x, y)
plot(x, y, xaxt="n", bty="n", pch=19, col="grey", xlab="Vaccine", ylab="Neutrophil count")
plot(x, y, xaxt="n", bty="n", pch=19:21[factor(armcd)], col="grey", xlab="Vaccine", ylab="Neutrophil count")
factor(armcd)
plot(x, y, xaxt="n", bty="n", pch=(19:21)[factor(armcd)], col="grey", xlab="Vaccine", ylab="Neutrophil count")
plot(1:25, 1:25, pch=1:25, cex=2)
plot(x, y, xaxt="n", bty="n", pch=(19:21)[factor(armcd)], col="grey", xlab="Vaccine", ylab="Neutrophil count")
segments(x[d0], y[d0], x[d1], y[d1])
x11()
plot(x, y, xaxt="n", bty="n", pch=(19:21)[factor(armcd)], col="grey", xlab="Vaccine", ylab="Neutrophil count")
segments(x[d0], y[d0], x[d1], y[d1], col="grey")
?axis
x
plot(x, y, bty="n", pch=(19:21)[factor(armcd)], col="grey", xlab="Vaccine", ylab="Neutrophil count")
segments(x[d0], y[d0], x[d1], y[d1])
x11()
plot(x, y, bty="n", pch=(19:21)[factor(armcd)], col="grey", xlab="Vaccine", ylab="Neutrophil count")
plot(x, y, bty="n", pch=(19:21)[factor(armcd)], col="grey", xlab="Vaccine", ylab="Neutrophil count", xaxt="n")
segments(x[d0], y[d0], x[d1], y[d1])
plot(x, y, bty="n", pch=(19:21)[factor(armcd)], col="grey", xlab="Vaccine", ylab="Neutrophil count", xaxt="n")
segments(x[d0], y[d0], x[d1], y[d1], col="grey")
levels(factor(group))
levels(factor(labwide$ARM))
axis(1, at=2*(1:3)-.5, labels=unique(labwide$ARM))
plot(x, y, bty="n", pch=(19:21)[factor(armcd)], col="grey", xlab="Vaccine", ylab="Neutrophil count", xaxt="n")
segments(x[d0], y[d0], x[d1], y[d1], col="grey")
axis(1, at=2*(1:3)-.5, labels=levels(factor(labwide$ARM)))
data(iris)
pca <- prcomp(iris[,1:4], scale.=TRUE)
plot(pca$x[,1], pca$x[,2], col=factor(iris$Species),
pch=19, bty="n")
legend("topright", levels(factor(iris$Species)),
pch=19, col=1:3, bty="n")
pca <- prcomp(iris[,1:4], scale.=TRUE)
class(pca)
head(pca$x)
cor(iris[,1], iris[,2])
cor(iris[,1], iris[,3])
plot(iris[,1], iris[,3], col=factor(iris$Species))
cor(pca$x[,1], pca$x[,2])
data(iris)
pca <- prcomp(iris[,1:4], scale.=TRUE)
plot(pca$x[,1], pca$x[,2], col=factor(iris$Species),
pch=19, bty="n")
legend("topright", levels(factor(iris$Species)),
pch=19, col=1:3, bty="n")
data(iris)
pca <- prcomp(iris[,1:4], scale.=TRUE)
plot(pca$x[,3], pca$x[,4], col=factor(iris$Species),
pch=19, bty="n")
legend("topright", levels(factor(iris$Species)),
pch=19, col=1:3, bty="n")
library(RColorBrewer)
display.brewer.all()
pal <- brewer.pal(n=3, "Dark2")
pal
plot(1:3, 1:3, pch=19, col=pal, cex=3)
cols <- pal[ factor(iris$Species) ]
cols
plot(pca$x[,1], pca$x[,2], col=cols,
pch=19, bty="n")
legend("topright", levels(factor(iris$Species)),
pch=19, col=pal, bty="n")
plot(pca$x[,1], pca$x[,2], col=cols,
pch=19, bty="n")
legend("topright", levels(factor(iris$Species)),
pch=19, col=pal, bty="n")
x11()
plot(pca$x[,1], pca$x[,2], col=cols,
pch=19, bty="n")
legend("topright", levels(factor(iris$Species)),
pch=19, col=pal, bty="n")
par(mfrow=c(1,2))
plot(pca$x[,1], pca$x[,2], col=cols, pch=19, bty="n")
plot(pca$x[,3], pca$x[,4], col=cols, pch=19, bty="n")
legend("topright", levels(factor(iris$Species)),
pch=19, col=pal, bty="n")
par(mfrow=c(1,2))
plot(pca$x[,1], pca$x[,2], col=cols, pch=19, bty="n")
plot(pca$x[,3], pca$x[,4], col=cols, pch=19, bty="n")
legend("topright", levels(factor(iris$Species)),
pch=19, col=pal, bty="n")
e <- readxl("../Rcrashcourse/Datasets/expression_data_vaccination_example.xlsx", sheet=3)
library(readxl)
e <- read_xlsx("../Rcrashcourse/Datasets/expression_data_vaccination_example.xlsx", sheet=3)
t <- read_xlsx("../Rcrashcourse/Datasets/expression_data_vaccination_example.xlsx", sheet=1)
head(e)
e <- data.matrix(e)
head(e)
View(e)
pca.e <- prcomp(t(e), scale.=TRUE)
plot(pca.e$x[,1], pca.e$x[,2], col=factor(paste(t$ARM, t$Timepoint)))
x11()
plot(pca.e$x[,1], pca.e$x[,2], col=factor(paste(t$ARM, t$Timepoint)))
paste(t$ARM, t$Timepoint)
factor(levels(paste(t$ARM, t$Timepoint)))
levels(factor(paste(t$ARM, t$Timepoint)))
plot(pca.e$x[,1], pca.e$x[,2], col=factor(paste(t$ARM, t$Timepoint)), pch=19)
plot(pca.e$x[,3], pca.e$x[,4], col=factor(paste(t$ARM, t$Timepoint)), pch=19)
plot(pca.e$x[,5], pca.e$x[,6], col=factor(paste(t$ARM, t$Timepoint)), pch=19)
legend("bottomleft", levels(factor(paste(t$ARM, t$Timepoint))))
plot(pca.e$x[,5], pca.e$x[,6], col=factor(paste(t$ARM, t$Timepoint)), pch=19)
legend("bottomleft", levels(factor(paste(t$ARM, t$Timepoint))), pch=19, col=1:6)
plot(pcaR2(pca, paste(t$ARM, t$Timepoint)))
plot(pcaR2(pca.e, paste(t$ARM, t$Timepoint)))
plot(pca.e$x[,5], pca.e$x[,32], col=factor(paste(t$ARM, t$Timepoint)), pch=19)
library(pca3d)
pca3d(pca.e, group = paste(t$ARM, t$Timepoint))
pca3d(pca.e, components = c(3,5,32), group = paste(t$ARM, t$Timepoint))
pca3d(pca.e, components = c(3,5,32), group = paste(t$ARM, t$Timepoint), legend="topright")
pca.e <- prcomp(t(e)[ t$ARM == "FLUAD", ], scale.=TRUE)
sel <- t$ARM == "FLUAD"
pca3d(pca.e, components = c(3,5,32), group = paste(t$ARM, t$Timepoint)[sel], legend="topright")
plot(pcaR2(pca.e, paste(t$ARM, t$Timepoint)[sel]))
pca3d(pca.e, components = c(1, 4, 8), group = paste(t$ARM, t$Timepoint)[sel], legend="topright")
data(mtcars)
mtcars
View(mtcars)
?mtcars
pairs(mtcars[,1:5])
pairs(mtcars[,1:5])
genePairs(mtcars[,1:5])
cor(mtcars)
cor(mtcars, method="kendall")
x <- c(rnorm(10), 5)
< <- c(rnorm(10), 5)
y <- c(rnorm(10), 5)
plot(x, y)
cor.test(x, y)
y <- c(rnorm(10))
x <- c(rnorm(10))
cor.test(x,y)
x <- c(rnorm(10), 5)
y <- c(rnorm(10), 5)
cor.test(x, y, method="kendall")
cor.test(x, y, method="spearman")
plot(x, y)
cor.test(x, y)
y <- c(rnorm(10), 5)
plot(x,y)
cor.test(x, y)
cor.test(x, y, method="spearman")
cor.test(x, y, method="kendall")
head(labwide)
which(colnames(labwide) == "ACA")
colnames(labwide)[6:ncol(labwide)]
lapply(colnames(labwide)[6:ncol(labwide)], function(tst) { x <- labwide[ ,tst] ; t.test(x[d0 & fluad], x[d1 & fluad]) })
lapply(colnames(labwide)[6:ncol(labwide)], function(i) { x <- labwide[ ,i] ; t.test(x[d0 & fluad], x[d1 & fluad]) })
ret <- lapply(colnames(labwide)[6:ncol(labwide)], function(i) { x <- labwide[ ,i] ; t.test(x[d0 & fluad], x[d1 & fluad]) })
ret[[1]]
ret[[1]]$p.value
ret <- lapply(colnames(labwide)[6:ncol(labwide)], function(i) { x <- labwide[ ,i] ; t.test(x[d0 & fluad], x[d1 & fluad])$p.value })
ret
ret <- sapply(colnames(labwide)[6:ncol(labwide)], function(i) { x <- labwide[ ,i] ; t.test(x[d0 & fluad], x[d1 & fluad])$p.value })
ret
ret2 <- sapply(colnames(labwide)[6:ncol(labwide)], function(i) { x <- labwide[ ,i] ; wilcox.test(x[d0 & fluad], x[d1 & fluad])$p.value })
warnings()
ret <- sapply(colnames(labwide)[6:ncol(labwide)], function(i) { x <- labwide[ ,i] ; t.test(x[d0 & fluad], x[d1 & fluad], paired=TRUE)$p.value })
ret2 <- sapply(colnames(labwide)[6:ncol(labwide)], function(i) { x <- labwide[ ,i] ; wilcox.test(x[d0 & fluad], x[d1 & fluad], paired=TRUE)$p.value })
ret2
plot(ret, ret2, log="xy")
abline(0, 1)
savehistory()
