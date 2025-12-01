library(dplyr) 
dataset1 <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Sahil", "Carol", "Ziven"),
  Age = c(18, 19, 20)
)

dataset2 <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Sahil", "Carol", "Ziven"),
  Feb_Sales = c(19, 20, 21)
)

dataset_new <- data.frame(
  ID = c(4, 5),
  Name = c("Saayli", "Ramit"),
  Jan_Sales = c(20, 30)
)

print("--- Dataset 1 ---")
print(dataset1)
print("--- Dataset2 ---")
print(dataset2)


merged <- merge(dataset1, dataset2, by = c("ID", "Name"))

print("--- Merged Data (Columns Added) ---")
print(merged_data)


final_list <- bind_rows(dataset1, dataset_new)

print("--- Appended Data (Rows Added) ---")
print(final_list)

rm(dataset1, dataset2, dataset_new)

