csv3 <- read.csv("csv3.csv")
View(csv3)
attach(csv3)
model <- lm(sepal_length ~ sepal_width)

summary(model)
