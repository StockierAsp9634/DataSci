Salaries <- read.csv("Data/Salary_Data.csv")
library(tidyverse)
library(reshape2)
library(parsnip)
library(rsample)
View(Salaries)


salariesWithoutNAs <- na.omit(Salaries_Num)
Salaries_Num <- select(Salaries, -Gender, -Education.Level, -Job.Title)

pcas<- prcomp(salariesWithoutNAs, scale. = T)
summary(pcas)
pcas$rotation

pca_vals <- as.data.frame(pcas$x)

ggplot(pca_vals, aes(PC1, PC2)) + geom_point() + theme_bw()
is.factor(Salary)

salaryCors <- cor(salariesWithoutNAs) |> 
  melt() |> 
  as.data.frame()
salaryCors

ggplot(salaryCors, aes(x = Var1, y = Var2, fill = value)) + 
                         geom_tile() + 
                         scale_fill_gradient2(low= "#90ee90", high = "#0f2310", mid = "#3d8c40",midpoint = 0.75)

ggplot(salariesWithoutNAs, aes(x=Years.of.Experience, y = Salary)) + geom_point() + geom_smooth() + theme_bw()
