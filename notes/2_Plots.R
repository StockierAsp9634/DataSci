##load required packages
install.packages(c("usethis", "credentials"))
library(ggplot2)
?ggplot2

#3mpg dataset
mpg
str(mpg)
?mpg
iris

str(iris)
ggplot(data = mpg, aes(x= hwy)) + 
  geom_histogram()

##histogram
#We can set the number of bars with 'bins'
ggplot(data = iris, aes(x=Sepal.Length)) + geom_histogram(bins=35) #default num of bins is 30

# We can set the size of bars with 'binwidth'
ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram(binwidth = 0.25)

head(iris)

ggplot(data = iris, aes(x=Sepal.Length, y = after_stat(count))) + geom_density() + 
  labs(title = "Frequency of Iris Sepal Lengths", x = "Sepal Length", y = "density")

ggplot(data = iris, aes(x=Sepal.Length)) + geom_boxplot()

ggplot(data = iris, aes(x= Sepal.Length, y= Species)) + geom_boxplot()

ggplot(data = mpg, aes)
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) + geom_violin()

## Violin and Boxplot
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) + geom_violin(color="darkgreen", fill = "gray") + geom_boxplot(width = 0.3)

## bar plot
ggplot(data = iris, aes(x= Species, y = Sepal.Length)) + geom_bar(stat= "summary", fun = "mean")

## Scatter Plots

ggplot(data = iris, aes(x=Species, y = Sepal.Width)) + geom_jitter(width = 0.25) # 'geom_jitter' randomly positions stuff on the x axis 

## Line Plots

ggplot(data = iris, aes(x=Sepal.Length, y = Sepal.Width)) + geom_line(stat = 'summary', fun = 'mean')

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() + geom_smooth(se = F) + 
  theme_minimal()
 
## Color scales

ggplot(data = iris, aes(x= Sepal.Length, y = Sepal.Width)) + geom_point(aes(color = Species)) + scale_color_manual(values = c("violet", "lightpink","red"))


## factors
mpg$year <- as.factor(mpg$year)

str(mpg)


iris$Species <- factor(iris$Species, levels = c("versicolor", "setosa", "virginica"))

?as.factor
?reorder
