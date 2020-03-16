timestamp()
##------ Fri Mar 13 12:54:19 2020 ------##

data("iris")
data(mtcars)
lm(mpg ~ hp, data=mtcars)
mod1 <- lm(mpg ~ hp, data=mtcars)
summary(mod1)
head(mtcars)
mod2 <- lm(mpg ~ hp + disp, data=mtcars)
summary(mod2)
head(mtcars)
gears <- factor(letters[mtcars$gear])
mod2 <- lm(mpg ~ gears, data=mtcars)
summary.aov(mod2)
summary(mod2)
gears
summary.aov(mod2)
mod2 <- lm(mpg ~ hp * disp, data=mtcars)
summary(mod2)
mod1 <- lm(mpg ~ hp, data=mtcars)
mod2 <- lm(mpg ~ hp + disp, data=mtcars)
mod2 <- lm(mpg ~ hp + disp, data=mtcars)
modi <- lm(mpg ~ hp * disp, data=mtcars)
aov(mod1, mod2)
anova(mod1, mod2)
mod1 <- lm(mpg ~ disp, data=mtcars)
summary(mod1)
summary(mod2)
anova(mod1, mod2)
anova(mod1, modi)
modc <- lm(mpg ~ disp, data=mtcars)
head(mtcars)
modc <- lm(mpg ~ disp + hp + cyl + gear + wt + qsec, data=mtcars)
modc <- lm(mpg ~ disp + hp + cyl + gear + wt + qsec + disp:hp, data=mtcars)
anova(mod1, modc)
summary(modc)
BIC(mod1, mod2, modc, modi)
modm <- lm(mpg ~ hp + wt + disp:hp, data=mtcars)
BIC(mod1, mod2, modc, modi, modm)
modh <- lm(mpg ~ hp, data=mtcars)
x11()
plot(modh)
plot(mtcars$hp, mtcars$mpg)
abline(modh)
modl <- lm(mpg ~ log(hp), data=mtcars)
BIC(mod1, mod2, modc, modi, modm, modl)
BIC(mod1, mod2, modc, modi, modm, modh, modl)
modm2 <- lm(mpg ~ log(hp) + wt + disp:hp, data=mtcars)
BIC(mod1, mod2, modc, modi, modm, modh, modl, modm2)
modl
plot(mtcars$hp, mtcars$mpg, log="x")
abline(modl)
x <- 50:350
predict(modl, x)
modl <- lm(mpg ~ log(hp), data=mtcars)
predict(modl, list(hp=x))
y <- predict(modl, list(hp=x))
lines(x, y)
y <- predict(modl, list(hp=x), interval = "conf")
head(y)
plot(x, y[,2], lty=2)
plot(mtcars$hp, mtcars$mpg, log="x")
lines(x, y[,1])
lines(x, y[,2], lty=2)
lines(x, y[,3], lty=2)
y <- predict(modl, list(hp=x), interval = "pred")
lines(x, y[,2], lty=3)
lines(x, y[,3], lty=3)
palfunc <- colorRampPalette(c("yellow", "purple"))
palfunc
palfunc(2)
palfunc(10)
col <- palfunc(10)
plot(1:10, pch=19, cex=3, col=col)
plot(rnorm(100), rnorm(100), pch=19, cex=3, col=col)
col
col <- paste0(col, "33")
plot(rnorm(100), rnorm(100), pch=19, cex=3, col=col)
col
res <- read.csv("Datasets/transcriptomics_results.csv")
library(disco)
disco <- list(
genes=res$GeneName,
lfc=res[ , c("logFC.F.D1", "logFC.F.D3")],
pval=res[ , c("qval.F.D1", "qval.F.D3")])
disco$ds <- disco.score(disco)
disco2 <- data.frame(disco$lfc, ds=disco$ds)
disco2 <- disco2[ order(abs(disco2$ds)), ]
pal <- colorRampPalette(colors=c("blue", "lightgrey", "red"))(17)
pal
x11()
plot(1:17, pch=19, col=pal)
pal <- paste0(pal, "66")
col <- tagcloud::smoothPalette(disco2$ds, pal=pal, min=-3, max=3)
plot(disco2[,1], disco2[,2], pch=19, bty="n",
xlab="Fold change on D1 vs D0", ylab="Fold change on D3 vs D0", col=col)
abline(h=0, col="grey")
x11()
plot(disco2[,1], disco2[,2], pch=19, bty="n", xlab="Fold change on D1 vs D0", ylab="Fold change on D3 vs D0", col=col)
abline(h=0, col="grey")
abline(v=0, col="grey")
genes <- read_xlsx("Datasets/expression_data_vaccination_example.xlsx",
sheet=2)
e <- read_xlsx("Datasets/expression_data_vaccination_example.xlsx",
sheet=3)
t <- read_xlsx("Datasets/expression_data_vaccination_example.xlsx",
sheet=1)
res <- read.csv("Datasets/transcriptomics_results.csv")
e <- data.matrix(e[ match(com, genes$ProbeName), ])
genes <- genes[ match(com, genes$ProbeName), ]
rownames(e) <- genes$GeneName
genes <- read_xlsx("Datasets/expression_data_vaccination_example.xlsx",
sheet=2)
e <- read_xlsx("Datasets/expression_data_vaccination_example.xlsx",
sheet=3)
e <- read_xlsx("Datasets/expression_data_vaccination_example.xlsx",
sheet=3)
t <- read_xlsx("Datasets/expression_data_vaccination_example.xlsx",
sheet=1)
t <- read_xlsx("Datasets/expression_data_vaccination_example.xlsx",
sheet=1)
res <- read.csv("Datasets/transcriptomics_results.csv")
## res and genes are not identical!
com <- intersect(genes$ProbeName, res$ProbeName)
com
length(com)
e <- data.matrix(e[ match(com, genes$ProbeName), ])
genes <- genes[ match(com, genes$ProbeName), ]
rownames(e) <- genes$GeneName
res <- res[ match(com, res$ProbeName), ]
all(res$ProbeName == genes$ProbeName)
n <- 50 # top 50
sel <- order(res$qval.F.D1)[1:n]
## ordering and selecting columns
group <- paste0(t$ARM, ".", t$Timepoint)
csel <- order(group)
## FLUAD only
csel <- csel[ csel %in% which(t$ARM == "FLUAD") ]
t[ csel, ]
n <- 50 # top 50
byqval <- order(res$qval.F.D1)
sel <- byqval[1:n]
downreg <- which(res$logFC.F.D1 < 0)
downreg <- byqval[ byqval %in% downreg ][1:50]
res[downreg, ]
n <- 25 # top 50
byqval <- order(res$qval.F.D1)
downreg <- which(res$logFC.F.D1 < 0)
downreg <- byqval[ byqval %in% downreg ][1:n]
sel <- c(sel, downreg)
## ordering and selecting columns
group <- paste0(t$ARM, ".", t$Timepoint)
csel <- order(group)
## FLUAD only
csel <- csel[ csel %in% which(t$ARM == "FLUAD") ]
library(gplots)
mtx <- t(e[sel, csel])
dim(mtx)
length(sel)
n <- 25 # top 50
byqval <- order(res$qval.F.D1)
sel <- byqval[1:n]
downreg <- which(res$logFC.F.D1 < 0)
downreg <- byqval[ byqval %in% downreg ][1:n]
sel <- c(sel, downreg)
length(sel)
csel <- order(group)
## ordering and selecting columns
group <- paste0(t$ARM, ".", t$Timepoint)
csel <- order(group)
## FLUAD only
csel <- csel[ csel %in% which(t$ARM == "FLUAD") ]
mtx <- t(e[sel, csel])
dim(mtx)
apply(mtx, 2, var)
apply(mtx, 2, means)
apply(mtx, 2, mean)
mtx <- scale(mtx)
apply(mtx, 2, mean)
apply(mtx, 2, var)
x11()
heatmap.2(mtx)
heatmap.2(mtx, trace = "n")
heatmap.2(mtx, trace = "n", dendrogram = "c")
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE)
pal <- colorRamp(c("blue", "green", "yellow"))
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE, col=pal)
pal <- colorRampPalette(c("blue", "green", "yellow"))
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE, col=pal)
pal <- colorRampPalette(c("cyan", "black", "purple"))
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE, col=pal)
pal <- colorRampPalette(c("blue", "white", "red"))
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE, col=pal)
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE, col=pal, breaks = seq(-2.1, 2.1, length.out = 15))
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE, col=pal, breaks = seq(-2.2, 2.2, length.out = 15))
mtx <- t(e[sel, csel])
x11()
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE, col=pal, breaks = seq(-2.2, 2.2, length.out = 15), scale="n")
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE, col=pal, breaks = seq(2.2, 10 length.out = 15), scale="n")
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE, col=pal, breaks = seq(2.2, 10, length.out = 15), scale="n")
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE, col=pal, breaks = seq(2.2, 19, length.out = 15), scale="n")
mtx <- scale(mtx)
heatmap.2(mtx, trace = "n", dendrogram = "c", Rowv = FALSE, col=pal, breaks = seq(-2.2, 2.2, length.out = 15))
x <- res$logFC.F.D1
y <- -log10(res$qval.F.D1)
plot(x, y)
sel <- abs(res$logFC.F.D1) > .5 & res$qval.F.D1 < .05
points(x[sel], y[sel], pch=19, col="red")
par(mfrow=c(1,2))
plot(x, y)
points(x[sel], y[sel], pch=19, col="red")
abline(v=0, col="lightgrey")
x2 <- res$logFC.F.D3
y2 <- -log10(res$qval.F.D3)
plot(x2, y2)
summary(y2)
plot(x, y)
points(x[sel], y[sel], pch=19, col="red")
y2 <- -log10(res$qval.F.D3)
plot(x2, y2, ylim=c(0, 2))
data("iris")
mtx <- irits[,1:4]
mtx <- iris[,1:4]
mtx <- scale(mtx)
head(iris)
unique(iris$Species)
dd <- dist(mtx)
dd
tree <- hclust(dd)
plot(tree, labels = iris[,5])
par(mfrow=c(1,1))
plot(tree, labels = iris[,5])
cl <- cutree(tree, k=3)
cl
table(cl, iris[,5])
pca <- prcomp(mtx)
pal <- brewer.pal(n=3, "Dark2")
plot(pca$x[,1], pca$x[,2], col=)
group <- factor(iris[,5])
plot(pca$x[,1], pca$x[,2], col=pal[cl], pch=c(15,17,19)[group])
plot(pca$x[,1], pca$x[,2], col=pal[cl], pch=c(15,17,19)[group], cex=2, bty="n")
pal <- paste0(pal, "99")
plot(pca$x[,1], pca$x[,2], col=pal[cl], pch=c(15,17,19)[group], cex=2, bty="n")
legend("topright", levels(group), pch=c(15,17,19), cex=2, bty="n")
plot(pca$x[,1], pca$x[,2], col=pal[cl], pch=c(15,17,19)[group], cex=2, bty="n")
plot(pca$x[,1], pca$x[,2], col=pal[cl], pch=c(15,17,19)[group], cex=3)
plot(pca$x[,1], pca$x[,2], col=pal[cl], pch=c(15,17,19)[group], cex=2, bty="n")
legend("topright", levels(group), pch=c(15,17,19), cex=3)
par(bty="n")
plot(pca$x[,1], pca$x[,2], col=pal[cl], pch=c(15,17,19)[group], cex=2)
par(cex=2)
plot(pca$x[,1], pca$x[,2], col=pal[cl], pch=c(15,17,19)[group])
?par
par(cex=1)
plot(pca$x[,1], pca$x[,2], col=pal[cl], pch=c(15,17,19)[group])
plot(pca$x[,1], pca$x[,2], col=pal[cl], pch=c(15,17,19)[group], cex=2)
legend("topright", levels(group), pch=c(15,17,19), cex=3)
cl <- cutree(tree, k=6)
pal <- brewer.pal(n=6, "Dark2")
pal <- paste0(pal, "99")
plot(pca$x[,1], pca$x[,2], col=pal[cl], pch=c(15,17,19)[group], cex=2)
kc <- kmeans(mtx)
kc <- kmeans(mtx, centers = 3)
kc$cluster
kc$centers
plot(pca$x[,1], pca$x[,2], col=pal[kc$centers], pch=c(15,17,19)[group], cex=2)
plot(pca$x[,1], pca$x[,2], col=pal[kc$cluster], pch=c(15,17,19)[group], cex=2)
legend("topright", levels(group), pch=c(15,17,19), cex=3)
?faces
??faces
?TeachingDemos:faces
?TeachingDemos::faces
data("longley")
faces(longley)
library(TeachingDemos)
faces(longley)
library(gapminder)
gapminder
years <- unique(gapminder$year)
years
summary(gapminder$lifeExp)
unique(gapminder$continent)
plot(NULL, xlim=range(years), ylim=range(gapminder$lifeExp))
cn <- unique(gapminder$country)
length(cn)
foo <- table(gapminder$country, gapminder$continent)
foo
head(foo)
co <- gapminder$continent[ match(cn, gapminder$country)]
co
head(co)
head(cn)
sapply(cn, function(x) { sel <- gapminder$country == x ; .cn <- })
cn
names(cn) <- co
head(cn)
names(co) <- cn
head(co)
col <- pal[ co ]
head(col)
names(col) <- cn
head(col)
sapply(cn, function(x) { sel <- gapminder$country == x ; lines(gapminder$year[sel], gapminder$lifeExp[sel]) })
head(gapminder)
gapminder$year
sapply(cn, function(x) { sel <- gapminder$country == x ; lines(gapminder$year[sel], gapminder$lifeExp[sel]) })
col
sapply(cn, function(x) { sel <- gapminder$country == x ; lines(gapminder$year[sel], gapminder$lifeExp[sel], col=col[x]) })
plot(NULL, xlim=range(years), ylim=range(gapminder$lifeExp))
sapply(cn, function(x) { sel <- gapminder$country == x ; lines(gapminder$year[sel], gapminder$lifeExp[sel], col=col[x]) })
legend("topleft", )
col
pal
co
pal[ unique(co)]
legend("bottomright", unique(co), col=pal[ unique(co)], lwd=2, lty=1)
legend("bottomright", as.character(unique(co), col=pal[ unique(co)], lwd=2, lty=1)
)
legend("bottomright", as.character(unique(co)), col=pal[ unique(co)], lwd=2, lty=1)
plot(NULL, xlim=range(years), ylim=range(gapminder$lifeExp))
sapply(cn, function(x) { sel <- gapminder$country == x ; lines(gapminder$year[sel], gapminder$lifeExp[sel], col=col[x]) })
legend("bottomright", as.character(unique(co)), col=pal[ unique(co)], lwd=2, lty=1)
head(gapminder)
summary(gapminder$gdpPercap)
summary(log(gapminder$gdpPercap))
sapply(cn, function(x) { sel <- gapminder$country == x ; points(gapminder$year[sel], log(gapminder$gdpPercap[sel])/2, col=col[x]) })
sapply(cn, function(x) { sel <- gapminder$country == x ; points(gapminder$year[sel], gapminder$lifeExp[sel], cex=log(gapminder$gdpPercap[sel])/2, col=col[x], pch=19) })
plot(NULL, xlim=range(years), ylim=range(gapminder$lifeExp))
sapply(cn, function(x) { sel <- gapminder$country == x ; lines(gapminder$year[sel], gapminder$lifeExp[sel], col=col[x]) })
foo <- sapply(cn, function(x) { sel <- gapminder$country == x ; points(gapminder$year[sel], gapminder$lifeExp[sel], cexj=sqrt(gapminder$gdpPercap[sel])/2, col=col[x], pch=19) })
warnings()
summary(sqrt(gapminder$gdpPercap))
foo <- sapply(cn, function(x) { sel <- gapminder$country == x ; points(gapminder$year[sel], gapminder$lifeExp[sel], cex=sqrt(gapminder$gdpPercap[sel])/20, col=col[x], pch=19) })
plot(NULL, xlim=range(years), ylim=range(gapminder$lifeExp))
foo <- sapply(cn, function(x) { sel <- gapminder$country == x ; points(gapminder$year[sel], gapminder$lifeExp[sel], cex=sqrt(gapminder$gdpPercap[sel])/30, col=col[x], pch=19) })
sapply(cn, function(x) { sel <- gapminder$country == x ; lines(gapminder$year[sel], gapminder$lifeExp[sel], col=col[x]) })
legend("bottomright", as.character(unique(co)), col=pal[ unique(co)], lwd=2, lty=1, pch=19)
savehistory()
