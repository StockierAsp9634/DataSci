Salaries <- read.csv("Data/Salary_Data.csv")
library(tidyverse)
library(reshape2)
library(parsnip)
library(rsample)
View(Salaries)

intGender <- mutate(Salaries, Gender= as.integer(as.factor(Gender)))
intEducation <- mutate(intGender, Education.Level = as.integer(as.factor(Education.Level)))

Salaries
salariesWithoutNAs <- na.omit(Salaries_Num)
Salaries_Num <- select(intEducation, -Job.Title)

pcas<- prcomp(salariesWithoutNAs, scale. = T)
summary(pcas)
pcas$rotation

pca_vals <- as.data.frame(pcas$x)

ggplot(pca_vals, aes(PC1, PC2)) + geom_point() + theme_bw()

salaryCors <- cor(salariesWithoutNAs) |> 
  melt() |> 
  as.data.frame()
salaryCors

ggplot(salaryCors, aes(x = Var1, y = Var2, fill = value)) + 
                         geom_tile() + 
                         scale_fill_gradient2(low= "#90ee90", high = "#0f2310", mid = "#3d8c40",midpoint = 0)

ggplot(salariesWithoutNAs, aes(x=Years.of.Experience, y = Salary)) + geom_point() + geom_smooth() + theme_bw()

set.seed(71723)

split <- initial_split(salariesWithoutNAs, prop = 0.75)
training <- training(split)
testing <- testing(split)

lm_fit <- linear_reg() |> 
  set_engine("lm") |> 
  set_mode("regression") |> 
  fit(Years.of.Experience ~ Age  + Salary, data = training)

lm_fit$fit
