library(tidyverse)

Salaries <- read.csv("Data/Salary_Data.csv")

Salaries
View(Salaries)

maleSalary <- Salaries |> filter(Gender == "Male")
femaleSalary <- Salaries |> filter(Gender == "Female")

t.test(maleSalary$Salary, femaleSalary$Salary, paired = F)

rm(list=ls())

?t.test

educationLevels <- Salaries |> 
  summarise(.by=Education.Level, 
            count =sum(!is.na(Education.Level))) |> 
  slice_max(count, n=3)

educationSalary <- Salaries |> 
  filter(Education.Level %in% educationLevels$Education.Level)

salaryEducation <- aov(data = educationSalary, Salary ~ Education.Level)
summary(salaryEducation)
TukeyHSD(salaryEducation)

## Chi Squares #### 
Salaries

Salaries


var <- table(Salaries$Gender, Salaries$Education.Level)
var<- table(cleanSalaries$Gender, cleanSalaries$Education.Level)
Bachelors <- filter(cleanEducation, Education.Level == "Bachelor's" | Education.Level == "Bachelor's ")
#Masters <- filter(cleanSalaries, Education.Level == "Master's" | Education.Level == "Master's Degree")
#phd <- filter(cleanSalaries, Education.Level == "phD" | Education.Level == "PhD")
Salaries <- mutate(Salaries, Education.Level = ifelse(grepl("phD", Education.Level), sub("phD", "PhD", Education.Level), Education.Level))
Salaries <- filter(Salaries, Education.Level != "")
var <- table(cleanerEducation$Gender, cleanerEducation$Education.Level, exclude = if useNA == "no") 
useNA = c("no", "ifany", "always")
table(Salaries$Gender, Salaries$Education.Level)
?table
View(var)
View(cleanSalaries)
chisqResults <- chisq.test(var)
chisqResults
corrplot(chisqResults$residuals)
View(cleanEducation)
?filter

unique(Salaries$Education.Level)
Bachelors
r