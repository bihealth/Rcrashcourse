list.files()
getwd() # get working directory

library(readr)
mtcars_wide <- read_csv("../Datasets/mtcars_wide.csv")
View(mtcars_wide)

library(readxl) # readxl, pronounced "read Excel"
fn <- readxl_example("deaths.xls")
data <- read_excel(fn)
data <- read_excel(fn, skip = 4, n_max = 10)


excel_sheets(fn) # sheets in an Excel file
date <- read_excel(fn, range = "A5:F15", sheet = "arts")
data <- read_excel(fn, range = "arts!A5:F15")

data
colnames(data)
data$`Has kids`

library(janitor)
data <- clean_names(data)

# reading the erroneous data sets
myiris <- read_csv("iris.csv")

# simplest approach
summary(myiris)
myiris <- clean_names(myiris)
summary(myiris)
myiris$sepal_length

# How to spot a messed up number
foo <- as.numeric(myiris$sepal_length)
which(is.na(foo))

meta <- read_excel("meta_data_botched.xlsx")
colnames(meta)
meta <- clean_names(meta)
summary(meta)

table(meta$placebo)
table(meta$sex)
table(meta$placebo, meta$arm)

library(colorDF)
print(summary_colorDF(meta), n = Inf)

meta_meta <- summary_colorDF(meta)

library(skimr)
skim(meta)

# Mending datasets
meta
unique(meta$sex)
males <- meta$sex == "Mann" | meta$sex == "männlich" | meta$sex == "Herr" | 
  meta$sex == "Male" | meta$sex == "male"
meta$sex[ males ] <- "M"
females <- meta$sex %in% c("F", "Femal", "female", "Female", "Frau", "Weiblich")
meta$sex[ females ] <- "F"
table(meta$sex)




