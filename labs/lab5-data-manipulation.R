library(tidyverse)

rm(list=ls())

salaries <- read.csv("Data/Salary_Data.csv")

salaries
filter(salaries, Education.Level == "Master's")

filter(salaries, Years.of.Experience <=5)
       
salaries_small <- select(salaries, -c(Age, Job.Title))

rm(Salary_List)

mutate(salaries_small, mean_salary = mean(Salary, na.rm=T), .by = Years.of.Experience)
mutate(salaries_small, salary_in_inr = Salary*82.4, na.rm = T)

summarise(salaries_small, mean_salary = mean(Salary, na.rm = T), .by = Education.Level)       

arrange(salaries_small, Education.Level)
