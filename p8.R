install.packages("tidyr")
library(dplyr)
library(tidyr) # Contains replace_na()

gap <- read.csv("csv3_gap.csv", na.strings = c("", "NA"))

print("--- 1. Original Data (First 6 Rows) ---")
print(head(gap))

# Check how many NAs are in each column
print("--- Count of Missing Values per Column ---")
print(colSums(is.na(gap)))

cleaned <- na.omit(gap)

print("--- 2. Data after na.omit() ---")
print(paste("Original rows:", nrow(gap)))
print(paste("Rows remaining:", nrow(cleaned)))
print(head(cleaned))


avg <- mean(gap$sepal_width, na.rm = TRUE)

replaced <- gap %>%
  replace_na(list(
    sepal_length = 0,
    sepal_width = 0,
    petal_length = 0,
    petal_width = 0
  ))

print("--- 3. Data after replace_na() ---")
print(replaced[1, ]) 
print(head(replaced))

print("--- Remaining NAs after replacement ---")
print(colSums(is.na(replaced)))
      