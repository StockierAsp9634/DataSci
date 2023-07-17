ifelse()
case_when()
library(tidyverse)
#Saving plots


## Practice with ifelse()
x<- 7
x <- c(1,3,5,7,9)
ifelse(x < 5, "small number", "big number")

head(iris)
mean(iris$Petal.Width)
iris_new <- iris

## Add categorical column 
iris_new <- mutate(iris_new, petal_size = ifelse(Petal.Width < 1, "big", "small"))
iris_new

iris_new <- mutate(iris_new, petal_size = case_when(Petal.Width < 1 ~ "small", Petal.Width < 2 ~ "medium", Petal.Width >= 2 ~ "big", 
                                                    .default = NA))
iris_new

ggplot(iris, aes(x=Sepal.Length, y = Sepal.Width)) + 
  geom_point()
