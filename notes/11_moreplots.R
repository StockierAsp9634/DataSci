library(tidyverse)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + 
  geom_point() + 
  scale_color_manual(values = c("red", "purple", "pink"), 
                     name = "Iris Species") + 
  scale_x_continuous(limits = c(0,8)) + 
  ylim(0,4.5) + 
  theme_minimal()+ 
  theme(axis.text = )

## geom_text and geom_label

ggplot(iris, aes(x=Sepal.Length))