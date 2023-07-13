library(tidyverse)

Salaries <- read.csv("Data/Salary_Data.csv")

Salaries
View(Salaries)

maleSalary <- Salaries |> filter(Gender == "Male")
femaleSalary <- Salaries |> filter(Gender == "Female")

t.test(maleSalary$Salary, femaleSalary$Salary, paired = F)

rm(list=ls())

?t.test
