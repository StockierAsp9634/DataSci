library(tidyverse)

rm(list=ls())

salaries <- read.csv("Data/Salary_Data.csv")

salaries
EducationSalary <- filter(salaries, Education.Level == "Master's")

EducationSalary

filter(salaries, Years.of.Experience <=5)
       
salaries_small <- select(salaries, -c(Age, Job.Title))


rm(Salary_List)

experienceSalary <- mutate(salaries_small, mean_salary = mean(Salary, na.rm=T), .by = Years.of.Experience)
mutate(salaries_small, salary_in_inr = Salary*82.4, na.rm = T)

experienceSalary

summarise(salaries_small, mean_salary = mean(Salary, na.rm = T), .by = Education.Level)       

arrange(salaries_small, Education.Level)

ggplot(data=experienceSalary, aes(x=Years.of.Experience, y = mean_salary)) + geom_point() + geom_smooth()

ggplot(data = salaries_small, aes(x=Years.of.Experience, y = Salary)) + geom_point() + geom_smooth()
      