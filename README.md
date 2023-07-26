# Analysis of Salaries 2023

This project is an analysis of a [dataset](https://www.kaggle.com/datasets/mohithsairamreddy/salary-data) of salaries in multiple different industries and sectors. Prior to the selection of this dataset, another [dataset](`https://www.kaggle.com/datasets/arnabchaki/data-science-salaries-2023`) was used. The usage of this older dataset is limited to some visualizations in the plots directory. Otherwise, all work moving forward is done with the first dataset. 

The purpose of this repository is to learn data analysis skills using R. 

## Directories

### [Data](https://github.com/StockierAsp9634/DataSci/tree/main/Data)
This directory contains the data used in the analysis. [Salary_Data.csv](https://github.com/StockierAsp9634/DataSci/blob/main/Data/Salary_Data.csv) is the more recent dataset, while the other one is deprecated and only used for the older analyses. 

### [Labs](https://github.com/StockierAsp9634/DataSci/tree/main/labs)
This directory contains the code used in the analyses. 

### [Plots](https://github.com/StockierAsp9634/DataSci/tree/main/plots)
This directory contains various plots of the data. The file names are a guide to what they contain. 

Here's a [dashboard](https://stockierasp9634.github.io/DataSci/dashboard.html) of the data. 

## Findings

The findings of the analysis were as follows: 

### Years of Experience vs Salary
Unsurprisingly, the more years of experience one has in their field, the more they tend to make. However, salaries tend to max out at around $200,000. 

![ExperiencevsSalary](https://github.com/StockierAsp9634/DataSci/assets/73668708/b0fb73ac-4d11-4214-bdd0-213c460591d9)

### Company Size vs Salary
Medium sized companies tend to pay more than both large sized companies and small sized companies. Small companies tend to be unable to offer as much pay as medium companies, and a potential reason large companies don't pay as much is due to their prestige. FAANG has no reason to pay a huge amount to attract talent because the top talent wants to work there anyway. 

![SalaryandSize](https://github.com/StockierAsp9634/DataSci/assets/73668708/daaf38ea-0dfa-4293-b2c3-7e9e04f87e3c)


### Correlation
Salary and Years of Experience are highly correlated, as well as Salary and Age. Salary and Education Level are also somewhat correlated, while Salary and Gender are not correlated as tightly. 

![correlation](https://github.com/StockierAsp9634/DataSci/assets/73668708/19f7e4dd-0b4c-48be-979c-a63fc74f8362)

## Models

There were several models used to perform these analyses: 

### LinReg
A linear regression model was used in this analysis. 

``` R
set.seed(71723)


split <- initial_split(salariesWithoutNAs, prop = 0.75)
training <- training(split)
testing <- testing(split)

lm_fit <- linear_reg() |> 
  set_engine("lm") |> 
  set_mode("regression") |> 
  fit(Years.of.Experience ~ Age  + Salary + Education.Level + Gender, data = training)

lm_fit$fit
summary(lm_fit$fit)


results <- testing
results$lm_pred <- predict(lm_fit, testing)$.pred
yardstick::mae(results, Years.of.Experience, lm_pred) #1.22 years, decently accurate prediction of Years of Experience
yardstick::rmse(results, Years.of.Experience, lm_pred) # 1.85 years, decently accurate prediction
```
### Boosted Decision Trees
A boosted decision trees model was used in the analysis. 

``` R
boost_fit <- boost_tree() |> 
  set_engine("xgboost") |> 
  set_mode("regression") |> 
  fit(Years.of.Experience ~ .,data = training )

boost_fit$fit$evaluation_log

results <- testing

results$treePredictor <- predict(boost_fit, testing)$.pred

yardstick::mae(results, Years.of.Experience, treePredictor) #0.573 years, very accurate prediction of Years of Experience
yardstick::rmse(results, Years.of.Experience, treePredictor) #0.961 years, accurate prediction of Years of Experience
```


