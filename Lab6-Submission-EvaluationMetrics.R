## ggplot2 ----
if (require("ggplot2")) {
  require("ggplot2")
} else {
  install.packages("ggplot2", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## mlbench ----
if (require("mlbench")) {
  require("mlbench")
} else {
  install.packages("mlbench", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## pROC ----
if (require("pROC")) {
  require("pROC")
} else {
  install.packages("pROC", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## dplyr ----
if (require("dplyr")) {
  require("dplyr")
} else {
  install.packages("dplyr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## readr ----
if (require("readr")) {
  require("readr")
} else {
  install.packages("readr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## e1071 ----
if (require("e1071")) {
  require("e1071")
} else {
  install.packages("e1071", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## factoextra ----
if (require("factoextra")) {
  require("factoextra")
} else {
  install.packages("factoextra", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## FactoMineR ----
if (require("FactoMineR")) {
  require("FactoMineR")
} else {
  install.packages("FactoMineR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## STEP 2. Load the Datasets ----

### The Boston Housing Dataset ----
# Execute the following to load the “BostonHousing” dataset which is offered
# in the "mlbench" package:
data("BostonHousing")
## 1.b. Determine the Baseline Accuracy ----
  # Identify the number of instances that belong to each class (distribution or
  # class breakdown).
  
  # The result should show that 65% tested negative and 34% tested positive
  # for diabetes.
  
  # This means that an algorithm can achieve a 65% accuracy by
  # predicting that all instances belong to the class "negative".
  
  # This in turn implies that the baseline accuracy is 65%.
data("BostonHousing")
boston_housing_medv <- BostonHousing$medv
cbind(frequency = table(boston_housing_medv),
      percentage = prop.table(table(boston_housing_medv)) * 100)
## 1.c. Split the dataset ----
# Define a 75:25 train:test data split of the dataset.
# That is, 75% of the original data will be used to train the model and
# 25% of the original data will be used to test the model.
# Define a 75:25 train-test split
set.seed(123)  # For reproducibility
train_index <- createDataPartition(BostonHousing$medv,
                                   p = 0.75,
                                   list = FALSE)
boston_housing_train <- BostonHousing[train_index, ]
boston_housing_test <- BostonHousing[-train_index, ]
# Define a train control with bootstrapping and 1,000 repetitions
train_control <- trainControl(method = "boot", number = 1000)

# Train a linear regression model to predict medv using all other variables
boston_model_lm <-
  train(medv ~ ., data = boston_housing_train,
        method = "lm", metric = "RMSE",
        trControl = train_control)

# Display the model's performance
print(boston_model_lm)  
# Make predictions using the Boston housing model on the test data
boston_predictions <- predict(boston_model_lm, newdata = boston_housing_test)

# Calculate RMSE
boston_rmse <- sqrt(mean((boston_housing_test$medv - boston_predictions)^2))
print(paste("RMSE =", boston_rmse))

# Calculate SSR (Sum of Squared Residuals)
boston_ssr <- sum((boston_housing_test$medv - boston_predictions)^2)
print(paste("SSR =", boston_ssr))

# Calculate SST (Total Sum of Squares)
boston_sst <- sum((boston_housing_test$medv - mean(boston_housing_test$medv))^2)
print(paste("SST =", boston_sst))

# Calculate R-squared
boston_r_squared <- 1 - (boston_ssr / boston_sst)
print(paste("R Squared =", boston_r_squared))
# Load the "BostonHousing" dataset
data("BostonHousing")

# Determine the Baseline Accuracy (you can skip this if not needed)
# The baseline accuracy will depend on the specific task you're trying to achieve.
# In regression tasks like the "BostonHousing" dataset, there's no direct concept of accuracy.

# Split the dataset with an 80:20 train-test split
set.seed(7)  # For reproducibility
train_index <- createDataPartition(BostonHousing$medv, p = 0.8, list = FALSE)
boston_housing_train <- BostonHousing[train_index, ]
boston_housing_test <- BostonHousing[-train_index, ]

# Define the train control for 10-fold cross-validation
train_control <- trainControl(
  method = "cv",
  number = 10,
  summaryFunction = twoClassSummary  # You can adjust this function for regression tasks
)

