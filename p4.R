install.packages("dplyr")
library(dplyr)
library(readr)

csv2 <- read_csv("csv2.csv")

head(csv2)


older_than_20_filter <- csv2 |>
filter(Age > 20)

cat("Number of students older than 20:", nrow(older_than_20_filter), "\n")
summary(older_than_20_filter$Age)
cat()

female_older_20_filter <- csv2 |>
filter(`Choose your gender` == "Female", Age > 20)

cat("Number of female students older than 20:", nrow(female_older_20_filter), "\n")
head(female_older_20_filter)

  
anxiety_or_panic_filter <- csv2 |>
filter(`Do you have Anxiety?` == "Yes" | `Do you have Panic attack?` == "Yes")

cat("Number of students with Anxiety OR Panic Attack:", nrow(anxiety_or_panic_filter), "\n")
head(anxiety_or_panic_filter)

  
year_1_or_2_filter <- csv2 |>
filter(`Year` %in% c("1", "2"))

cat("Number of students in Year 1 or Year 2:", nrow(year_1_or_2_filter), "\n")
table(year_1_or_2_filter$`Year`)

