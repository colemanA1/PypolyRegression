#Mulitple Linear Regression
dataset = read.csv('50_Startups.csv')


dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))
#Split the dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting Multiple Linear Regression to the Training set
regressor = lm(formula=Profit~.,
               data = training_set)
y_pred = predict(regressor, newdata=test_set)
