library(dplyr)

csv3 <- read.csv("csv3.csv")

print("--- Original Dataset (First 3 rows) ---")
print(head(csv3, 3))

selected <- csv3 %>%
  select(petal_length, sepal_length, sepal_width)

print("--- Selected Specific Columns ---")
print(head(selected, 3))

range <- csv3 %>%
  select(sepal_length:sepal_width)

print("--- Selected Range of Columns ---")
print(head(range, 3))

startswith <- csv3 %>%
  select(starts_with("sepal"))

print("--- Selected columns starting with 'sepal' ---")
print(head(startswith, 3))

dropped <- csv3 %>%
  select(-sepal_width)

print("--- Dataset with 'sepal_width' dropped ---")
print(names(dropped)) 

dropped_multi <- csv3 %>%
  select(-sepal_width, -petal_length)

print("--- multiple datasets dropped ---")
print(names(dropped_multi))

rangeddrop <- csv3 %>%
  select(-(sepal_length:petal_length))

print("--- Dataset with range dropped ---")
print(names(rangeddrop))

