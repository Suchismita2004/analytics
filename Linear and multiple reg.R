women
names(women)
colnames(women)
str(women)
summary(women)
##--------------------------------------SIMPLE LINEAR REGRESSION----------------------
model1 <- lm(weight~height, data = women) # linear modelling
model1
summary(model1)
#one variable: multiple Rsquare
#more than one variable: Adjusted R square (it will fall down when variable do not improve accuracy)
# it penalises for incompetent variables


y = mx+c
height=c(63) 
weight <- 3.45*height - 87.5
weight

ndata1 = data.frame(height=c(63,66,69))
p1=predict(model1, newdata = ndata1 , type = "response")
cbind(ndata1,p1)

#range of heights
range(women$height)
# we cannot do extrapolation, can only do intrapolation for which the values has been already provided
#multiple r square value means 99 % of the variation in weight is due to height

mtcars
head(mtcars)
model2 = lm(mpg~wt+hp+disp, data = mtcars) # more than one variable
summary(model2)
#p value >.05 implies displacement not representing mileage
#star mark is the indicator that we should retain the variable for interpreting
# lesser the p value more stars we have

model3 = lm(mpg~wt+hp, data = mtcars) # more than one variable
summary(model3)

#this value of R sqyare can capture that much of variation : importance of R square or Adjusted R square







