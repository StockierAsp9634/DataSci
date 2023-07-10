2+2
number <- 5
print(number)
number
number + 1
number <- number +1

number <- 10 #set number to 10

# R Objects ####
ls() # print the name of all objects in the environment
rm(name) #removes a certain character
number <- 5
decimal <- 1.5

letter <- "a"

word <- "hello"

logic <- TRUE
logic2<- T

##types of variables

##there are three main classes: numeric, character, and logical
class(number)

class(decimal)

class(letter)

class(word)

class(logic)

##there is more variation in types

typeof(number) ##double
typeof(decimal) ##double

##you can also change the type of an object
as.character(number)
as.integer(number)
as.integer(decimal) #this will force the decimal to become an integer, cutting off anything after the integer.


#rounding numbers
round(decimal) 
round(22/7, 3) #3 values after the decimal

?round

ceiling(22/7) #ceiling always rounds up
floor(3.9) #floor always rounds down

?as.integer

word_as_int <- as.integer("hello") #can't turn a word into an integer, makes it NA

decimal <- round(decimal)

#NA Values
word_as_int + 5 #will still be NA

##object naming

name <- "Sarah"
NAME <- "Joe"

n.a.m.e <- "Sam"
n_a_m_e <- "Lisa"

##illegal naming characters: 
#starting with a number 
#starting with an underscore
#operators: + -/ * 
#conditionals: & | < > !
#others: \ , space

#good naming conventions: 
camelCase <- "first word lowercase start second word uppercase start"
snake_case <- "underscores between words"

## Object manipulation ####
number
number + 7
decimal + number #add variables together

name

paste(name, "Parker", "is", "awesome") #concatenates character vectors
paste(name, "Parker is awesome")
paste0(name, "Parker")

paste(name, number)
logic <- T
paste0(name, logic)
paste()
paste(name, "Parker is cool and is", number, "years old")
?paste

letter

#Pattern Matching: It finds the me in watermelon and says true
?grep

food <- "watermelon"

grepl("me", food)

#substituting characters in words
sub("me", "you", food)
sub("me", "", food)

#Vectors ####
#make a vector of numerics
numbers <- c(2, 4, 6, 8, 10) 
range_of_vals <- 1:5 #all integers from 1 to 5
5:10 # all integers from 5 to 10
seq(2,10,2) # from 2 to 10 by 2's
seq(from=2, to= 10, by = 2)
seq(1,10,2)

rep(3, 5) #repeats the number 3 5 times
rep(c(1,2), 5)#repeats "1 2" 5 times

#how can we get all the values between 1 and 5 by 0.5?

seq(1,5, 0.5) #get all values between 1 and 5 by increments of 0.5

#how can we get {1 1 1 2 2 2}

c(rep(1,3), rep(2,3))
rep(c(1,2), each = 3)

?rep
?seq
#make a vector of characters
letters <- c("a", "b", "c") #concatenates all the letters together

paste('a', 'b', 'c') # paste() is different from c()

letters <- c(letters, "d")
letter
letters <- c(letters, letter)
letters <- c("x", letters, "w")

# make a vector of random numbers between 1 and 20

numbers <- seq(1,20, 1)

numbers
five_nums <-sample(numbers, 5) #choose 5 random values from the vector

five_nums <- sort(five_nums) #puts the numbers in order
rev(five_nums) #puts the numbers in reverse order

?sample

fifteen_nums <- sample(numbers, 15, replace = TRUE)
fifteen_nums <- sort(fifteen_nums)
fifteen_nums
length(fifteen_nums) # length of a vector
unique(fifteen_nums) #what are the unique values in the vector
length(unique(fifteen_nums)) # how many unique values are there

table(fifteen_nums) # get the count of values in the vector

fifteen_nums + 5
fifteen_nums/2

nums1 <- c(1,2,3)
nums2<- c(4,5,6)
nums1 + nums2

nums3 <- c(nums1, nums2)
nums3 + nums1 # values are recycled to add together once it ends
nums3 + nums1 + 1

#The difference between these two is one of them adds one to every value in the vector while the other only adds one to the final value
sum(nums3 + 1)
sum(nums3) + 1
nums3 + 1

#Vector indexing
numbers <- rev(numbers)
numbers[1] #The value of "numbers" at position 1
numbers[5] #at position 5

numbers [c(1,2,3,4,5)]
sum(numbers[c(1:5)])

i<-5
numbers[i]
table(fifteen_nums)

#Datasets ####
?mtcars
mtcars #print entire dataset to console
View(mtcars) # pulls up entire dataset in a new tab

summary(mtcars) #gives us the name of every variable and some statistics relating to the overall spread
str(mtcars) # see the structure of the dataset

names(mtcars) #names of the variables
head(mtcars) #preview the first number of rows(default 6)

## Pull out individual variables as vectors
mpg <- mtcars[,1] # blank means "all". All rows, first column
mtcars[2,2] #value at second row, second column 
mtcars[3,] # third row, all columns

# First 3 columns
mtcars[,1:3]

# use the names to pull out columns 
mtcars$gear #dollar sign allows R to access every column
mtcars[,c("gear", "mpg")] #pull out the gear and mpg columns

sum(mtcars$gear)

#Statistics ####
iris

iris$Sepal.Length
first5 <-iris$Sepal.Length[1:5]

mean(first5)
mean(iris$Sepal.Length)
median(first5)

median(iris$Sepal.Length)

max(first5) - min(first5)

range(first5)

range(iris$Sepal.Length)

max(iris$Sepal.Length)- min(iris$Sepal.Length)

var(first5)
var(iris$Sepal.Length)
?var

sqrt(var(first5))
sd(first5)
sd(iris$Sepal.Length)

IQR(iris$Sepal.Length) #range of the middle 50% of the data

quantile(first5, 0.25) #Q1
quantile(first5, 0.75) #Q3

isOutlier <- quantile(first5,0.25) - (1.5*bleh)
isOutlier              
4.7-1.95

bleh <- IQR(iris$Sepal.Length)

## outliers
sl <- iris$Sepal.Length

mean(sl) - 3*sd(sl)
mean(sl) + 3*sd(sl)

as.numeric(quantile(sl, 0.25) - 1.5*IQR(sl))
quantile(sl, 0.75) + 1.5*IQR(sl)


## Subsetting vectors
first5
first5 < 4.75 | first5 > 5 # THe bar represents or
first5[first5 < 4.75] # removes every value over 4.75

values <- c(first5, 3,9)
upper <- mean(sl) + 3*sd(sl)
lower <- mean(sl) - 3*sd(sl)

#removes outliers
values[values > lower & values < upper]

## read in data
getwd()#get working directory
superData <- read.csv("Data/super_hero_powers.csv") # reading in data


## Conditionals ####
x <- 5 #set x to 5

x < 3
x > 3
x == 3
x==5
x!= 3 #exclamation point means not 

## We can test all values of a vector at once
numbers <- 1:5

numbers < 3
numbers ==3 

numbers[1]
numbers[c(1,2)]

numbers[numbers <3]#numbers "where" numbers < 3 

# outlier thresholds
lowerLimit <- 2 
upperLimit <- 4

#pull out only outliers
numbers[numbers < lowerLimit]
numbers[numbers > upperLimit]

#combine with | (or)
numbers[numbers <lowerLimit | numbers > upperLimit]

# use & to get all values in between outlier thresholds
numbers[numbers >= lowerLimit & numbers <= upperLimit]

#using & with outlier thresholds don't work
numbers[numbers < lowerLimit & numbers > upperLimit]

## NA Values
NA #unknown
NA + 5

sum(1,2,3, NA) #returns NA if any value is NA
sum (1,2,3,NA, na.rm = T) #removes NA values

mean(c(1,2,3,NA), na.rm=T)

