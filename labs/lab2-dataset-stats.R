library(tidyverse)

ds_salaries <- read.csv("Data/ds_salaries.csv")
ds_salaries
View(ds_salaries)

#### Raw Data ####
salary <- ds_salaries$salary_in_usd

mean_salary <- mean(salary)

mean_salary

iqr_salary <- IQR(salary)
median(salary)

max(salary) - min(salary)

var_salary <- var(salary)
var(ds_salaries$salary_in_usd)
standarddev <-sd(salary)
IQR(salary)
q3_salary <- quantile(salary, 0.75)
q1_salary <- quantile(salary, 0.25)
upper_limit <- q3_salary + 1.5 *iqr_salary
lower_limit <- q1_salary - 1.5*iqr_salary
as.numeric(quantile(salary, 0.25) - 1.5*IQR(salary))
quantile(salary, 0.75) + 1.5*IQR(salary)
upper_limit
lower_limit

outliers = salary[salary < lower_limit | salary > upper_limit]

salary2<- salary[salary >= lower_limit & salary <= upper_limit]
salary2

mean(salary2)
median(salary2)
View(salary2)

boxplot(salary)
  "blue"
  label

plot(salary)
plot(salary2)
