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
![SalaryandSize](https://github.com/StockierAsp9634/DataSci/tree/main/plots/SalaryandSize.png)

### Correlation
Salary and Years of Experience are highly correlated, as well as Salary and Age. Salary and Education Level are also somewhat correlated, while Salary and Gender are not correlated as tightly. 
![Correlation](https://github.com/StockierAsp9634/DataSci/tree/main/plots/correlation.png)



