n=1000
roll.no = 1:n
roll.no

sname = paste('Student', 1:n, sep = "_")
sname
gender= sample(c("M","F"), size=1000, replace=T, prob=c(.35,.65)) #M,F
gender
table(gender)

(age= runif(1000, min = 20,max = 30)) #between 20 and 30, uniform dist
age=round(age)
age

(marks1= rnorm(1000, mean = 65, sd=10)) #mean=65,sd=10, normally distributed
marks1=round(marks1,digits = 2)
marks1

(marks2= rnorm(1000, mean = 70, sd=8)  )# mean=70,sd=8, normally distributed
marks2=round(marks2, digits = 2)
marks2

course= sample(c('btech','mtech','phd'), size=n,replace=T,prob=c(.7,.2,.1))
course

passfail= sample(c(0,1), size=1000,replace=T, prob= c(0.4,0.6)) #pass fail on placement drive
passfail                                                        #can check using table

dataiitb <-data.frame(sname,gender,age,course,marks1,marks2,passfail)
dataiitb

#properties of the data frame
dim(dataiitb)
summary(dataiitb)
nrow(dataiitb)
ncol(dataiitb)
str(dataiitb)
class(dataiitb)
class(dataiitb$sname)
class(dataiitb$gender)
class(dataiitb$age)
class(dataiitb$marks1)
head(dataiitb)
tail(dataiitb)

write.csv()
#_____________________________________________________________________________

#read data from url
data2 = read.csv("https://raw.githubusercontent.com/dupadhyaya/hheanalytics/master/data/dataiitb.csv")
head(data2)

library(dplyr)
#gender wise summary
data2 %>% group_by(gender) %>% summarise(meanM1= mean(marks1), meanM2=mean(marks2))

#gender and course wise summary
data2 %>% group_by(gender,course) %>% summarise(meanM1= mean(marks1), meanM2=mean(marks2),minA= min(age),sdA = sd(age))%>% arrange(meanM1)

#arrange the data in order of marks
data2 %>% group_by(gender,course) %>% summarise(meanM1= mean(marks1), meanM2=mean(marks2),minA= min(age),sdA = sd(age), count=n())%>% arrange(gender,desc(sdA))

# who are the top 2 students from each gender from marks of subject2
data2 %>% group_by(gender)%>%arrange(gender,marks2)%>% top_n(2,marks2)

#make a barplot gender distribution
barplot(height=c(10,20))
table(data2$gender)
barplot(height=table(data2$gender),col=1:2)
barplot(height= table(data2$course),col = 1:2)
hist(data2$marks1,breaks=5,col=1:5)
plot(density(data2$marks1))
plot(density(data2$age))

#create a linear model of marks1 from age
fit1=lm(marks2 ~ age, data=data2)
summary(fit1)

fit1=lm(marks2 ~ age + marks1, data=data2)
summary(fit1)


#create a logistic model to predict passfail from marks1, marks2 and gender
fit2= glm(passfail~marks1+marks2+gender+course, data = data2, family='binomial')
summary(fit2)

# craete a DT using previous case of logistic model
library(rpart)
fit3=rpart(passfail~ marks1+marks2+gender, data=data2, method = 'class')
summary(fit3)

#clustering
fit5 = kmeans(data2[,c('age','marks1','marks2')],centers = 4)
fit5$centers
