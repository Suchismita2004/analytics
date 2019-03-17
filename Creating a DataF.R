n=1000
roll.no = 1:n
roll.no

sname = paste('Student', 1:n, sep = "_")
sname
gender= sample(c("M","F"), size=1000, replace=T) #M,F
gender

(age= runif(1000, min = 20,max = 30)) #between 20 and 30, uniform dist
age=round(age)
age

(marks1= rnorm(1000, mean = 65, sd=10)) #mean=65,sd=10, normally distributed
marks1=round(marks1,digits = 2)
marks1

(marks2= rnorm(1000, mean = 70, sd=8)  )# mean=70,sd=8, normally distributed
marks2=round(marks2, digits = 2)
marks2

passfail= sample(c(0,1), size=1000,replace=T, prob= c(0.4,0.6)) #pass fail on placement drive
passfail                                                        #can check using table

dataiitb <-data.frame(sname,gender,age,marks1,marks2,passfail)
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


