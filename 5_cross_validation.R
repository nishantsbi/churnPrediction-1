# create training and test samples 

library(caret)
library(mlbench)
library(bootstrap)

# normalization (optional)

preprocessParams <- preProcess(churn[,1:4], method=c("range"))

# splitting data set into a training and testing set

churnNum$choice <- factor(churnNum$choice, levels=c(0,1), labels=c("not-churn", "churn"))

set.seed(1234)
trainRule <- sample(nrow(churnNum), 0.7*nrow(churnNum))
train <- churnNum[trainRule,]
test <- churnNum[-trainRule,]
