install.packages("stringr")
install.packages("tidyr")
library(stringr)
library(tidyr)
library(dplyr)

store_data <- data.frame(
  Product_ID = c("FOOD-9921-2024", "TOYS-6712-2023", "BOOK-2489-2025", "GARD-7394-2022", "AUTO-5631-2024"),
  Product_Info = c("Food - Chocolate Box", 
                   "Toys - Remote Car", 
                   "Books - Fantasy Novel", 
                   "Garden - Plant Fertilizer",
                   "Automobile - Car Cover"),
  Price = c(120, 899, 350, 450, 1299)
)

print("--- Original Dataset ---")
print(store_data)

store_data$Category_Code <- str_sub(store_data$Product_ID, 1, 4)

store_data$Year <- str_sub(store_data$Product_ID, -4, -1)

print("--- Data after str_sub() ---")
print(store_data %>% select(Product_ID, Category_Code, Year))

split_list <- str_split(store_data$Product_Info, " - ")
print("--- Basic Split Output (First Item in List) ---")
print(split_list[[1]])

split_matrix <- str_split(store_data$Product_Info, " - ", simplify = TRUE)

store_data$Main_Category <- split_matrix[, 1]
store_data$Item_Name     <- split_matrix[, 2]

print("--- Data after str_split() Manual Assignment ---")
print(store_data %>% 
        select(Product_Info, Main_Category, Item_Name))

tidy_output <- store_data %>%
  separate(Product_ID, into = c("Dept", "Code", "Release_Year"), sep = "-")

print("--- Bonus: The 'separate' Function Output ---")
print(tidy_output %>% select(Dept, Code, Release_Year))
