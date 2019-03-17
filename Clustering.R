# group the customers: request from the ceo

kmeans()
mtcars$mpg
str(mtcars)
dim(mtcars)
nrow(mtcars)
ncol(mtcars)
class(mtcars)

?mtcars
summary(mtcars)
df = mtcars
head(df)
df$cyl = factor(df$cyl)
head(df)# study the data frame to see which variable to be grouped together to form clusters
#eucledian distance between variables to determine the clusters.
#after first iteration new centroid is created.
# iteration keeps on going until distance remain unchanged
summary(df)
str(df)
df$cyl
##---------------------------clustering on the basis of one variable---------------------------------##
model4 <- kmeans(mtcars$mpg, centers = 3) #doing cluster only on the basis of mileage into 3 groups
model4
model4$cluster
cbind(mtcars$mpg, model4$cluster)
model4$centers #gives the average values of the mileages of the clusters

##---------------------more than one variable------------------------------
model4 <- kmeans(mtcars[,c('mpg','wt')], centers = 3) 
model4
model4$cluster
cbind(mtcars[,c('mpg','wt')], model4$cluster)
model4$centers # average mileage and avg weights of each cluster

##--------------------------------------Three variable------------------------------
model4 <- kmeans(mtcars[,c('mpg','wt','disp')], centers = 3) 
model4
model4$cluster
df2 <- cbind(mtcars[,c('mpg','wt','disp')], model4$cluster)
df2
model4$centers # average mileage and avg weights of each cluster

typeof(mtcars$disp)
library(dplyr)
df2 %>% arrange(model4$cluster)
?dplyr






