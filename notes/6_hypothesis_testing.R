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