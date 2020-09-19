library(caTools)
library(ROCR)
library(rpart)
library(rpart.plot)
library(caret)
library(randomForest)
library(e1071)

setwd("G:\\Desktop\\R\\HomeWork\\DS-4")
why = read.csv("employees_lr_ct_rf_cv_models.csv")

set.seed(129)
split = sample.split(why$left, SplitRatio = 0.75)
Test = subset(why, split == FALSE)
Train = subset(why, split == TRUE)

#LOGIT 82%

HRlog = glm(left ~ satisfaction_level + last_evaluation 
            + number_project + average_montly_hours + time_spend_company 
            + Work_accident + promotion_last_5years + salary, 
            data = Train, family=binomial)
summary(HRlog)
LogPreTrain = predict(HRlog, type = "response")
LogPredTrain = prediction(LogPreTrain, Train$left)
LogPerfTrain = performance(LogPredTrain, "tpr", "fpr")
plot(LogPerfTrain, colorize=TRUE, 
     print.cutoffs.at=seq(0,1,by=0.1), text.adj=c(-0.2,1.7))

LogPreTest = predict(HRlog, Test, type = "response")

t = table(Test$left, LogPreTest>0.43)
t
(t[1,1]+t[2,2])/sum(t)

#CART TREE 97%

HRcart = rpart(left ~ satisfaction_level + last_evaluation 
               + number_project + average_montly_hours + time_spend_company 
               + Work_accident + promotion_last_5years + salary, 
               data = Train, method = "class", minbucket = 25)
prp(HRcart)
CARTpre = predict(HRcart, Test, type = "class")
t = table(Test$left, CARTpre)
t
(t[1,1]+t[2,2])/sum(t)

#Cross Validation 98%

numFolds = trainControl(method = "cv", number = 10)
cpGrid = expand.grid(.cp = seq(0.001,0.01,0.001))
train(left ~ satisfaction_level + last_evaluation 
      + number_project + average_montly_hours + time_spend_company 
      + Work_accident + promotion_last_5years + salary, 
      data = Train, method = "rpart", trControl = numFolds, tuneGrid = cpGrid)
HRcart = rpart(left ~ satisfaction_level + last_evaluation 
               + number_project + average_montly_hours + time_spend_company 
               + Work_accident + promotion_last_5years + salary, 
               data = Train, method = "class", cp = 0.001)
#prp(HRcart)
summary(HRcart)
CVpre = predict(HRcart, Test, type = "class")
t = table(Test$left, CVpre)
t
(t[1,1]+t[2,2])/sum(t)

#Random Forest 99%

Train$left = as.factor(Train$left)
Test$left = as.factor(Test$left)

GRRF = randomForest(left ~ satisfaction_level + last_evaluation 
                    + number_project + average_montly_hours + time_spend_company 
                    + Work_accident + promotion_last_5years + salary, 
                    data = Train)
ForestPre = predict(GRRF, Test)
confusionMatrix(ForestPre, Test$left)