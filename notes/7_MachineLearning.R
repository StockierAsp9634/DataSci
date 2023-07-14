## Unsupervised Learning ####
## Principal Components Analysis
iris

## remove any non numeric variables\
iris_num <- select(iris, -Species)
iris_num

##do PCA
pcas<- prcomp(iris_num, scale. = T)
summary(pcas)
pcas$rotation

# Get the x values of PCAs and make it a data frame
pca_vals <- as.data.frame(pcas$x)
ggplot(pca_vals, aes(PC1, PC2, color=Species)) + geom_point() + theme_bw()
pca_vals$Species <- iris$Species
pca_vals
