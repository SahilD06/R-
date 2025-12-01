library(dplyr)

csv2 <- read.csv("csv2.csv")

csv2_sorted_age <- csv2 |>
  arrange(Age)
head(csv2_sorted_age, 5)

csv2_sorted_age_desc <- csv2 |>
  arrange(desc(Age))
head(csv2_sorted_age_desc, 5)

csv2_multi <- csv2 |>
  arrange(Age,desc(Year))
head(csv2_multi, 5)

csv2_filter_sort <- csv2 |>
  filter(Age>20)|>
  arrange(Year)
head(csv2_filter_sort)

print(csv2|> 
        select(Age, Year)|>head(5))