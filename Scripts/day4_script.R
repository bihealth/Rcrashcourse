### loading libraries
library(tidyverse)

### loading data

df <- data.frame(ara=1:5, bera=6:10, cora=11:15, dora=16:20)
df

df$ara
df[["ara"]]
df$ara

df[ , 1]
df[ 1, ]

library(tidyverse)
tb <- as_tibble(df)
tb
tb[ , 1]
tb[["ara"]]
tb$ara

print(ara) # this is an error
df[[ ara ]] # this doesn't work
df[[ "ara" ]]

select(df, ara)
select(df, -ara) # all columns BUT ara
vec <- c(1, 5, 7)
vec[ -1 ]
df
select(df, ara, cora)
df3 <- select(df, ara:cora)
vec[ 1:2 ]

select(df, parrot = ara, explorer = dora)
# what if we want to keep the other columns and rename just the two?

select(df, parrot = ara, bera, cora, explorer = dora)

# or use a function that specifically renames the columns
rename(df, parrot = ara, explorer = dora)

# of course you could do it without tidyverse
# colnames(df) <- c("parrot", colnames(2:3), "explorer")

trdata <- read_csv("transcriptomics_results.csv")
summary(trdata)
colnames(trdata)
trdata <- select(trdata, GeneName, Description, logFC.F.D1, qval.F.D1)
colnames(trdata) <- c("Gene", "Description", "LFC", "FDR")
# alternatively:
trdata <- rename(trdata, Gene = GeneName, LFC = logFC.F.D1, FDR = qval.F.D1)

# alternatively:
trdata <- read_csv("transcriptomics_results.csv")
trdata <- select(trdata, Gene = GeneName, Description = Description, 
                 LFC = logFC.F.D1, FDR = qval.F.D1)

# introducing sample
sample(LETTERS, 3)
sample(LETTERS)
sample(c("heads", "tails"), 10, replace = TRUE)

v <- sample(1:10)/10 
sort(v)
sort(sample(LETTERS))
rev(sort(v))
sort(v, decreasing = TRUE)

# order function is more useful
# instead of values, it gives us the POSITIONS in the original vector
order(v)
sort(v)
v[ order(v) ]

df <- data.frame(id=paste0("ID", 1:10), val=rnorm(10))
ord <- order(df$val)
df[ ord, ]

df[ order(abs(df$val), decreasing=TRUE), ]

# sort with tidyverse
arrange(df, val)
arrange(df, desc(val))
arrange(df, desc(abs(val)))
df

arrange(trdata, FDR)
arrange(trdata, desc(abs(LFC)))

df <- data.frame(group = sample(rep(LETTERS[1:2], each=4)),
                 val = rnorm(8))
df <- arrange(df, val)
df <- arrange(df, group)

df <- data.frame(group = sample(rep(LETTERS[1:2], each=4)),
                 val = rnorm(8))
df <- arrange(df, group, val)

# filtering
sel <- trdata$FDR < 0.05

sel
trdata[41, ]
arrange(trdata[ sel, ], FDR)

filter(trdata, FDR < 0.05)
arrange(filter(trdata, FDR < 0.05))

trsign <- filter(trdata, FDR < 0.05)
trneg <- filter(trsign, LFC < 0)
# alternatively:
trneg <- filter(trdata, FDR < 0.05, LFC < 0)
# or
trneg <- filter(trdata, FDR < 0.05 & LFC < 0)

trneg <- arrange(trneg, Gene)

plot(trdata$LFC, -log10(trdata$FDR), pch=".")
points(trneg$LFC, -log10(trneg$FDR), pch=19, col="blue")

# searching in data frames
isgs <- c("TAP1","IFIH1","IRF7","PARP9","STAT1","PLSCR1",
                "IFITM1","HERC5","DDX60","USP18","RSAD2","IFIT1", "GBP4")
isgs
sel <- trdata$Gene %in% isgs
arrange(trdata[ sel, ], FDR)

filter(trdata, Gene %in% isgs, FDR < 0.05)

oursearch <- filter(trdata, grepl("interferon", Description, ignore.case = TRUE))
arrange(oursearch, FDR)
arrange(filter(trdata, grepl("^GBP", Gene)), FDR)

sel_int <- grepl("interferon", trdata$Description, ignore.case = TRUE)
sel_gbp <- grepl("^GBP", trdata$Gene)
oursearch <- filter(trdata, sel_int | sel_gbp)
oursearch

# merging
df1 <- data.frame(ID=sample(letters, 15), value1=rnorm(15))
df2 <- data.frame(ID=sample(letters, 15), value2=rnorm(15))
intersect(df1$ID, df2$ID)

merge(df1, df2, by="ID") # inner join
merge(df1, df2, by="ID", all = TRUE) # outer join
merge(df1, df2, by="ID", all.x = TRUE) # left outer join
merge(df1, df2, by="ID", all.y = TRUE) # right outer join

# subtleties with merge
df1 <- data.frame(ID=c("a", "a", "b", "c"), no=c(1, 2, 1, 1), 
                  value=rnorm(4))
df2 <- data.frame(ID=c("a", "a", "b", "c"), no=c(1, 2, 1, 1), 
                  value=rnorm(4))
merge(df1, df2, by="ID")
merge(df1, df2, by=c("ID", "no"))

# alternative: create a new identifier
df1$patient_visit <- paste(df1$ID, "_", df1$no)
df2$patient_visit <- paste(df2$ID, "_", df2$no)
merge(df1, df2, by="patient_visit")

# pipes
arrange(filter(select(read_csv("transcriptomics_results.csv"), Gene = GeneName, Description = Description, 
                      LFC = logFC.F.D1, FDR = qval.F.D1), FDR < 0.05), FDR)


sign_genes <- read_csv("transcriptomics_results.csv") |> 
  select(Gene = GeneName, Description = Description, 
         LFC = logFC.F.D1, FDR = qval.F.D1) |>
  filter(FDR < 0.05) |>
  arrange(FDR)

a <- 2
2 -> a

c(label1 = 1, label2 = 2)

read_csv("transcriptomics_results.csv") |> 
  select(Gene = GeneName, Description = Description, 
         LFC = logFC.F.D1, FDR = qval.F.D1) |>
  filter(FDR < 0.05) |>
  arrange(FDR) -> sign_genes



# f(x) |> g() is the same g(f(x)) 
2 +
  4
