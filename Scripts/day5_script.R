# Day 5

## Visualizations

data(iris)
# PCA with the iris data set

boxplot(iris[ , 1:4])

iris_scaled <- scale(iris[ , 1:4])
boxplot(iris_scaled)
# apply a function to each column
apply(iris_scaled, 2, mean)
apply(iris_scaled, 2, sd)

pca <- prcomp(iris[ , 1:4 ], scale. = TRUE)

# base R plotting
plot(pca$x[ , 1], pca$x[ , 2])
plot(pca$x[ , 1], pca$x[ , 2], xlab="PC1", ylab="PC2")
plot(pca$x[ , 1], pca$x[ , 2], xlab="PC1", ylab="PC2", pch=19)
plot(pca$x[ , 1], pca$x[ , 2], xlab="PC1", ylab="PC2", pch=19, col="red")

View(pca$x)

plot(pca$x[ , 1], pca$x[ , 2], xlab="PC1", ylab="PC2", pch=19, col="#E0CF9099")
plot(pca$x[ , 1], pca$x[ , 2], xlab="PC1", ylab="PC2", pch=19, col=2)

iris$Species

# how to turn iris$Species into numbers?
# dirty trick:
colors <- as.numeric(as.factor(iris$Species))
plot(pca$x[ , 1], pca$x[ , 2], xlab="PC1", ylab="PC2", pch=19, col=colors)

# please try this:
pal <- c(setosa = "#228096", versicolor = "#DED5CA", virginica = "#00436C")

pca <- prcomp(iris[ , 1:4 ], scale. = TRUE)

plot(pca$x[ , 1], pca$x[ , 2], xlab="PC1", ylab="PC2", 
     pch=19, 
     col=pal[ iris$Species ])

gn_col <- c(37, 102, 146)/255
gn_col[1]
gn_col_hex <- rgb(gn_col[1], gn_col[2], gn_col[3])

pal_gn <- c(setosa = gn_col_hex, versicolor = "#DED5CA", virginica = "#00436C")
plot(pca$x[ , 1], pca$x[ , 2], xlab="PC1", ylab="PC2", 
     pch=19, 
     col=pal_gn[ iris$Species ])

library(RColorBrewer)
display.brewer.all()
display.brewer.all(colorblindFriendly = TRUE)

pal_br <- brewer.pal(3, "Dark2")
pal_br
names(pal_br) <- unique(iris$Species)
pal_br

plot(pca$x[ , 1], pca$x[ , 2], xlab="PC1", ylab="PC2", 
     pch=19, 
     col=pal_br[ iris$Species ])

# 00 (max transparency) 0 1 2 3 4 5 6 7 8 9 A B C D E F
# to FF (max opacity)
pal_br_tr <- paste0(pal_br, "99")
pal_br
pal_br_tr

plot(pca$x[ , 1], pca$x[ , 2], xlab="PC1", ylab="PC2", 
     pch=19, 
     col=pal_br_tr[ iris$Species ])

## ggplot2
library(tidyverse)
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, color = Species)) +
  geom_point(alpha = .5) +
  theme_minimal() +
  scale_color_manual(values = pal_br)
  # scale_color_brewer(palette = "Dark2")
  # scale_color_viridis_d()
# boxplot
ggplot(iris, aes(1, Sepal.Length, color = Species)) +
  geom_boxplot() +
  theme_minimal()

library(ggbeeswarm)  
ggplot(iris, aes(Species, Sepal.Length, color = Species)) +
  geom_violin() +
  geom_beeswarm() +
  theme_minimal()

# creating a PCA plot with ggplot
df <- as.data.frame(pca$x)
df$Species <- iris$Species

# alternative way
df <- cbind(iris, pca$x)

ggplot(df, aes(PC1, PC2, color=Species)) +
  geom_point(alpha = .7) +
  scale_color_manual(values = pal_br) +
  theme_light()

library(gghotelling)
ggplot(df, aes(PC1, PC2, color=Species)) +
  geom_point(alpha = .7) +
  geom_hotelling()

# running a t test
# two ways of getting species-specific values
spw_versicolor <- iris$Sepal.Width[ iris$Species == "versicolor"]
spw_virginica <- iris |> filter(Species == "virginica") |> pull(Sepal.Width)
t.test(spw_versicolor, spw_virginica)

df <- iris |> filter(Species != "setosa")
t.test(Sepal.Width ~ Species, data = df)
# or on one line
t.test(Sepal.Width ~ Species, data = iris |> filter(Species != "setosa"))
t.test(Sepal.Width ~ Species, data = iris) # this does not work

# simple ANOVA
summary(aov(Sepal.Width ~ Species, data = iris))

# linear model (linear regression)
lmod <- lm(Sepal.Width ~ Sepal.Length, data = iris)
summary(lmod)

lmod <- lm(Sepal.Width ~ Sepal.Length + Species, data = iris)
summary(lmod)
anova(lmod)
plot(lmod)

plot(iris$Sepal.Width, iris$Sepal.Length)


