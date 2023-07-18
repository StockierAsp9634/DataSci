## Unsupervised Learning ####
## Principal Components Analysis
iris

## remove any non numeric variables\
iris_num <- select(iris, -Species)
iris_num

##do PCA
pcasexample<- prcomp(iris_num, scale. = T)
summary(pcas)
pcas$rotation

pcas$rotation^2

# Get the x values of PCAs and make it a data frame
pca_valsexample <- as.data.frame(pcasexample$x)
ggplot(pca_valsexample, aes(PC1, PC2)) + geom_point() + theme_bw()
pca_valsexample$Species <- iris$Species
pca_vals


### Supervised Machine Learning Models ####
install.packages("tidymodels")
library(parsnip)
library(rsample)
library()

## Step 1: Collect Data
head(iris)

## Step 2: Clean and Process Data
## Get rid of NAs
#only use na.omit when you have specifically selected for the
#variables you want to include in the mdel
noNAs <- na.omit(starwars)
noNAs <- filter(starwars, !is.na(mass), !is.na(height))

# Replace with Means
replaceWithMeans <- mutate(starwars, mass = ifelse(is.na(mass), mean(mass), mass))

## Encoding categories as factors or integers
# If categorical variable is a character, make it a factor
intSpecies <- mutate(starwars, species= as.integer(as.factor(species)))

# If categorical variable is already a factor, make it an integer
irisAllNumeric <- mutate(iris, 
                         Species = as.integer(Species))
## Step 3: Visualize Data
# Make a PCA
# Calculate Correlations
library(reshape2)


irisCors <- cor(irisAllNumeric) |> 
  melt() |> 
  as.data.frame()
irisCors

ggplot(irisCors, aes(x = Var1, y = Var2, fill = value)) + 
  geom_tile() + 
  scale_fill_gradient2(low= "red", high = "blue", mid = "white", 
                       midpoint = 0)
## High Correlation?
ggplot(irisAllNumeric, aes(x = Petal.Length, y = Sepal.Length)) + 
  geom_point() + 
  theme_bw()

# Low correlation? 
ggplot(irisAllNumeric, aes( x= Sepal.Width, y = Sepal.Length)) + 
  geom_point() + theme_bw()

## Step 4: Perform Feature Selection
# Choose which variables you want to classify or predict
# Choose which variables you want to use as features in your model
# For iris data...
# Classify on species(Classification) & Predict on Sepal.Length(Regression)

## Step 5: Separate Data into Testing and Training Sets
# Choose 70-85% of the data to train on 
library(rsample)

## Set a seed for reproducability
set.seed(71723)

## Put 75% of data into the training set
reg_split <- initial_split(irisAllNumeric, prop = 0.75) # Create a split
reg_train <- training(reg_split) # Use the split to form testing and training sets
reg_test <- testing(reg_split)

## Classification dataset splits(use iris instead of irisAllNumeric)
class_split <- initial_split(iris, prop = 0.75)
class_train <- training(class_split)
class_test <- testing(class_split)

## Steps 6 and 7: Choose a ML Model and train it
## Linear Regression
lm_fit2 <- linear_reg() |> 
  set_engine("lm") |> 
  set_mode("regression") |> 
  fit(Sepal.Length ~ Petal.Length + Petal.Width + Species + Sepal.Width, 
      data = reg_train)

## Sepal.Length=2.05 + Petal.Length*0.8360 + Petal.Width*-0.4902 + Species *-0.3704 + Sepal.Width*0.6468



lm_fit2$fit
summary(lm_fit2$fit)

## Logistic Regression 
# For logistic regression, 
# 1. Filter data to only 2 groups in categorical variable of interest
# 2. Make the categorical variable a factor
# 3. Make your training and testing splits

# FOr our purposes, we are just going to filter test and training(don't do this)
binary_test_data <- filter(class_test, Species %in% c("setosa", "versicolor"))
binary_train_data <- filter(class_train, Species %in% c("setosa", "versicolor"))

# Build the model
log_fit <- logistic_reg() |> 
  set_engine("glm") |> 
  set_mode("classification") |> 
  fit(Species ~ Petal.Width + Petal.Length + ., data = binary_train_data)

log_fit$fit
summary(log_fit$fit)

## Boosted Decision Trees
boost_fit <- boost_tree() |> 
  set_engine("xgboost") |> 
  set_mode("regression") |> 
  fit(Sepal.Length ~ ., data = reg_train)

boost_fit$fit$evaluation_log

# classification
#use "classification" as the mode, anmd use Species as the predictor
boostClassFit <- boost_tree() |> 
  set_engine("xgboost") |> 
  set_mode ("classification") |> 
  fit(Species ~., data = class_train)

boostClassFit$fit$evaluation_log

## random Forest
# regression

library(ranger)
install.packages("ranger")
forestRegFit <- rand_forest() |> 
  set_engine("ranger") |> 
  set_mode("regression") |> 
  fit(Sepal.Length ~ ., data = reg_train)

forestRegFit$fit

forestClassFit <- rand_forest() |> 
  set_engine("ranger") |> 
  set_mode("classification") |> 
  fit(Species ~ ., data = class_train)
forestClassFit$fit

## Step 8: Evaluate Model Performance on Test Set 
# Calculate errors for regression
library(yardstick)
#lm_fit, boost_reg_fit, forestRegFit)
reg_results <- reg_test

reg_results$lm_pred <- predict(lm_fit2, reg_test)$.pred
reg_results$boost_pred <- predict(boost_fit, reg_test)$.pred
reg_results$forest_pred <- predict(forestRegFit, reg_test)$.pred

yardstick::mae(reg_results, Sepal.Length, lm_pred)
yardstick:: mae(reg_results, Sepal.Length, boost_pred)
yardstick:: mae(reg_results, Sepal.Length, forest_pred)

yardstick::rmse(reg_results, Sepal.Length, lm_pred)
yardstick:: rmse(reg_results, Sepal.Length, boost_pred)
yardstick:: rmse(reg_results, Sepal.Length, forest_pred)

# Calculate accuracy for classification models
install.packages("Metrics")
library(Metrics)
class_results <- class_test

class_results$lm_pred <- predict(log_fit, class_test)$.pred_class
class_results$boost_pred <- predict(boostClassFit, class_test)$.pred_class
class_results$forest_pred <- predict(forestClassFit, class_test)$.pred_class

f1(class_results$Species, class_results$lm_pred)
f1(class_results$Species, class_results$boost_pred)
f1(class_results$Species, class_results$forest_pred)

class_results$Species == "setosa"
class_results$boost_pred == "setosa"

f1(class_results$Species == "versicolor", class_results$boost_pred == "versicolor")
