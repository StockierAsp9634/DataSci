## Compare the mass of male and female human star wars characters
## null hypothesis: average mass of male and female star wars characters is the same
## Alternative hypothesis: average mass of male and female characters is different
library(tidyverse)
swHumans <- starwars |> filter(species == "Human", mass > 0)
starwars
rm(list=ls())
males <- swHumans |> filter(sex == "male")
females <- swHumans |> filter(sex == "female")
females

t.test(males$mass, females$mass, paired = F, alternative= "two.sided")
# p value is 0.06 
# not significant, failed to reject null hypothesis

##ANOVA ####
iris

anova_results <- aov(data = iris, Sepal.Length ~ Species)

## Are any groups different from each other?
summary(anova_results)

## Which ones?
TukeyHSD(anova_results)

## Is there a significant difference in the mean petal lengths or petal widths by species?
anova_results <- aov(data = iris, Petal.Length ~ Species)
summary(anova_results)
TukeyHSD(anova_results)
anova_results <- aov(data = iris, Petal.Width ~ Species)

### StarWars
library(tidyverse)
head(starwars)

## Which 5 species are the most common?
top3species <- starwars |> 
  summarise(.by = species, 
            count = sum(!is.na(species))) |> 
  slice_max(count, n = 3)
top3species

starwars_top3species <- starwars |> 
  filter(species %in% top3species$species)

## Is there a significant difference in the mass of each of the top 3 species?
bleh <- aov(height ~ species, starwars_top3species)
View(bleh)
summary(a)
TukeyHSD(a)
rm(a)

## Chi-Squared ####
starwars_clean <- starwars |> 
  filter(!is.na(species), 
         !is.na(homeworld))

something <- table(starwars_clean$species, starwars_clean$homeworld)
View(something)
chisq.test(something) # not enough data to provide accurate

View(mpg)
?mpg
table(mpg$manufacturer, mpg$class)
table(mpg$cyl, mpg$displ)

## How do we get a contingency table of year and drv?

something <- table(mpg$year, mpg$drv)

chisq_result <- chisq.test(something)
chisq_result
chisq_result$p.value
chisq_result$residuals

plot(chisq_result$residuals)

install.packages("corrplot")
library(corrplot)

corrplot(chisq_result$residuals)

## chi-squared full analysis
heroes <- read.csv("Data/heroes_information.csv")
head(heroes)

## clean data 
heroes_clean <- heroes |> 
  filter(Alignment != "-", 
         Gender != "-")
## plot the counts of alignment and gender
ggplot(heroes_clean, aes(x = Gender, y = Alignment)) + 
  geom_count(color="red") + 
  theme_bw()

## make contingency table
t <- table(heroes_clean$Alignment, heroes_clean$Gender)
t

## chi squared test
chi <- chisq.test(t)
chi$p.value
chi$residuals

corrplot(chi$residuals, is.cor = F)
