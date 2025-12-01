install.packages(c("readr", "psych"))

library(readr)    
library(psych)    
csv2 <- read.csv("csv2.csv")
head(csv2)
tail(csv2)
dim(csv2)
cat("Dimensions (Rows, Columns): ", dim(csv2), "\n")
str(csv2)
summary(csv2)
names(csv2)
cat("Column Names: ", names(csv2), "\n")
describe(csv2)


