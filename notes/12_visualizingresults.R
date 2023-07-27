## Creating a data frame
zooData <- data.frame(animals = c("lion", "tiger", "bear"), 
           age= c(10,2,7))

predicted <- c(1,3,5,7,6)

actual <- c(2,4,1,8,6)

library(MLmetrics)

Accuracy(actual, predicted)
errors <- data.frame(mae= MAE(actual, predicted), 
                     rmse = RMSE(actual, predicted), 
                     modelType="randForest")

predicted2 <- c(5,6,5,9,3)
errors<- rbind(data.frame(mae= MAE(actual, predicted2), 
                          rmse = RMSE(actual, predicted2), 
                          modelType = "boostTree"))

# make a dataframe all at once
errors <- data.frame(mae = c(MAE(actual, predicted), MAE(actual, predicted2)), 
                     rmse = c(RMSE(actual, predicted), RMSE(actual, predicted2)), 
                     modelType = c("randForest", "boostTree"))

## make a plot of errors
library(ggplot2)
ggplot(errors, aes(x = modelType, y = rmse)) + 
  geom_bar(stat = "summary")

values <- data.frame(actual = actual, 
                     predicted = predicted, 
                     predicted2 = predicted2)
ggplot(values, aes(x= actual,  y = predicted)) + 
  geom_abline(lty = "dashed", color = "grey") + 
  geom_point() + 
  theme_minimal() + 
  annotate(geom = "text", label = paste("rmse =",RMSE(actual, predicted)), 
             x = 6, y = 1.5)
