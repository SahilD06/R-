  library(dplyr)
  library(tidyr) 
  
  df <- read.csv("csv8.csv", na.strings = c("", "NA"))
  
  cleaned <- df %>%
    mutate(
      QP1 = replace_na(QP1, 0),
      QP2 = replace_na(QP2, 0),
      QP3 = replace_na(QP3, 0),
      QP4 = replace_na(QP4, 0),
      SP1 = replace_na(SP1, 0),
      SP2 = replace_na(SP2, 0),
      SP3 = replace_na(SP3, 0),
      SP4 = replace_na(SP4, 0))
  
  print("--- Cleaned Baseline Data ---")
  print(head(cleaned))

  calc <- df %>%
    mutate(
      DA1 = QP1 * (SP1 / 100),
      DA2 = QP2 * (SP2 / 100),
      DA3 = QP3 * (SP3 / 100),
      DA4 = QP4 * (SP4 / 100),
      
      Final1 = QP1 - DA1,
      Final2 = QP2 - DA2,
      Final3 = QP3 - DA3,
      Final4 = QP4 - DA4
    )
  print("--- Method A: Arithmetic Results (Final Values) ---")
  print(calc %>% select(QP1, SP1, DA1, Final1,
                           QP2, SP2, DA2, Final2,
                           QP3, SP3, DA3, Final3,
                           QP4, SP4, DA4, Final4))
  

  logic <- df %>%
    mutate(
      Label_QP1 = ifelse(QP1 > 4000, "High Score", "Normal"),
      Label_QP2 = ifelse(QP2 > 4000, "High Score", "Normal"),
      Label_QP3 = ifelse(QP3 > 4000, "High Score", "Normal"),
      Label_QP4 = ifelse(QP4 > 4000, "High Score", "Normal"),
      
      Type_SP1 = ifelse(SP1 > 20000, "Premium Tier", "Basic Tier"),
      Type_SP2 = ifelse(SP2 > 20000, "Premium Tier", "Basic Tier"),
      Type_SP3 = ifelse(SP3 > 20000, "Premium Tier", "Basic Tier"),
      Type_SP4 = ifelse(SP4 > 20000, "Premium Tier", "Basic Tier")
    )
  
  print("--- Method B: Logic Results (Labels) ---")
  print(logic %>% select(
    QP1, Label_QP1, SP1, Type_SP1,
    QP2, Label_QP2, SP2, Type_SP2,
    QP3, Label_QP3, SP3, Type_SP3,
    QP4, Label_QP4, SP4, Type_SP4
  ))

  text <- df %>%
    mutate(
      Summary_QP1 = paste("QP1 value is", QP1, "with SP1 =", SP1),
      Summary_QP2 = paste("QP2 value is", QP2, "with SP2 =", SP2),
      Summary_QP3 = paste("QP3 value is", QP3, "with SP3 =", SP3),
      Summary_QP4 = paste("QP4 value is", QP4, "with SP4 =", SP4)
    )
  
  print("--- Method C: Text Transformation ---")
  print(head(text$Summary_QP1))
  print(head(text$Summary_QP2))
  print(head(text$Summary_QP3))
  print(head(text$Summary_QP4))

  final <- df %>%
    mutate(
      Final_QP1 = QP1 - (QP1 * SP1 / 100),
      Final_QP2 = QP2 - (QP2 * SP2 / 100),
      Final_QP3 = QP3 - (QP3 * SP3 / 100),
      Final_QP4 = QP4 - (QP4 * SP4 / 100),
      
      High_Value_QP1 = ifelse(Final_QP1 > 2000, TRUE, FALSE),
      High_Value_QP2 = ifelse(Final_QP2 > 2000, TRUE, FALSE),
      High_Value_QP3 = ifelse(Final_QP3 > 2000, TRUE, FALSE),
      High_Value_QP4 = ifelse(Final_QP4 > 2000, TRUE, FALSE),
      
      Status_QP1 = paste0("QP1: ", round(QP1, 1), " / SP1: ", SP1, "%"),
      Status_QP2 = paste0("QP2: ", round(QP2, 1), " / SP2: ", SP2, "%"),
      Status_QP3 = paste0("QP3: ", round(QP3, 1), " / SP3: ", SP3, "%"),
      Status_QP4 = paste0("QP4: ", round(QP4, 1), " / SP4: ", SP4, "%")
    )
  
  print("--- Final Combined Dataset ---")
  print(head(final))
  
