# Install required packages if not already installed
install.packages("tidyverse")
install.packages("caret")
install.packages("randomForest")
install.packages("ROSE")
install.packages("xgboost")

# Load libraries
library(tidyverse)
library(caret)
library(randomForest)
library(ROSE)      # Handling class imbalance
library(xgboost)   # Advanced machine learning model


# Read CSV file (Update path accordingly)
credit_data <- read.csv(choose.files())
credit_data

# Check structure of data set
str(credit_data)

# View summary statistics
summary(credit_data)


# Check missing values
sum(is.na(credit_data))  

# Fraud vs Non-Fraud Distribution
table(credit_data$Class)  

# Visualize fraud cases
ggplot(credit_data, aes(x = Class, fill = as.factor(Class))) +
  geom_bar() +
  scale_fill_manual(values = c("blue", "red")) +
  ggtitle("Distribution of Fraudulent Transactions")


# Balance data set using ROSE
balanced_data <- ROSE(Class ~ ., data = credit_data, seed = 123)$data
balanced_data

# Check new class distribution
table(balanced_data$Class)

# Convert Class column to factor
balanced_data$Class <- as.factor(balanced_data$Class)

# Split 80% train, 20% test
trainIndex <- createDataPartition(balanced_data$Class, p = 0.8, list = FALSE)
train_data <- balanced_data[trainIndex, ]
test_data  <- balanced_data[-trainIndex, ]

# Verify Split
table(train_data$Class)
table(test_data$Class)

set.seed(123)  # For reproducibility


# Make Predictions
rf_pred <- predict(rf_model, test_data)

# Confusion Matrix
confusionMatrix(rf_pred, test_data$Class)



# Convert data to matrix format for XGBoost
train_matrix <- as.matrix(train_data %>% select(-Class))
test_matrix <- as.matrix(test_data %>% select(-Class))

train_label <- train_data$Class
test_label <- test_data$Class

# Train XGBoost model
xgb_model <- xgboost(
  data = train_matrix,
  label = train_label,
  nrounds = 100,
  objective = "binary:logistic"
)

# Make Predictions
xgb_pred <- predict(xgb_model, test_matrix)
xgb_pred_class <- ifelse(xgb_pred > 0.5, 1, 0)

# Confusion Matrix
confusionMatrix(as.factor(xgb_pred_class), as.factor(test_label))


# Compute AUC (Area Under Curve)
library(pROC)
roc_curve <- roc(test_data$Class, as.numeric(xgb_pred))
auc(roc_curve)
plot(roc_curve, col="blue", main="ROC Curve for Fraud Detection")
