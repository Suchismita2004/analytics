#partition the data into train and test set
mtcars
nrow(mtcars)
#train-70%, test-30%
#set.seed(1234) <- repeats the same smaple
selected<- sample(x=1:32, size=.7 * 32) #randomly selecting a part of the sample

length(selected)
index = sample(x=1:nrow(mtcars), size=.7 * nrow(mtcars), replace=F)
index

#concept
mtcars[c(1,4),]
mtcars[-c(1,4),]

#concept utilised
train=mtcars[index,]
test= mtcars[-index,]
nrow(train)
nrow(test)
nrow(train) + nrow(test)








#-------

## 75% of the sample size
smp_size <- floor(0.75 * nrow(mtcars))

## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(mtcars)), size = smp_size)

train <- mtcars[train_ind, ]
test <- mtcars[-train_ind, ]

# -----
#caTools: proportion of classification results is equally distributed in training and test samples.
require(caTools)
set.seed(101) 
sample = sample.split(mtcars$am, SplitRatio = .75)
sample
train = subset(mtcars, sample == TRUE)
test  = subset(mtcars, sample == FALSE)
train; test
table(train$am); table(test$am)

mtcars$id <- 1:nrow(mtcars)
train <- mtcars %>% dplyr::sample_frac(.75)
test  <- dplyr::anti_join(mtcars, train, by = 'id')

library(caret)
intrain<-createDataPartition(y=factor(mtcars$am),p=0.7,list=FALSE)
intrain
training<-mtcars[intrain,]
testing<-mtcars[-intrain,]
training  
testing
table(training$am)
table(testing$am)
