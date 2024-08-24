#HW13.R
library(randomForest)

#set working directory to the folder where have placed the HW13.csv data
setwd("C:\Users\cc877\OneDrive\Pictures\Documents\Data-101")
data <- read.csv("HW13.csv",header=TRUE)
#
data <- transform(
  data,
  x1=as.factor(x1),
  x2=as.factor(x2),
  x3=as.factor(x3),
  x4=as.factor(x4),
  x5=as.factor(x5),
  x6=as.factor(x6),
  y=as.factor(y)    
)
#
set.seed(13245) #need set.seed() for reproducibility
#
(rf <- randomForest(y ~ .,data=data,ntree=1000,mtry=2,importance=TRUE,))
#
pred = predict(rf, newdata=data)
table_rf = table(pred,data$y)
#
rf$importance  #generate variable importance information

##----------------------------------------##

