## Credit Card Fraud Detection<br>
🚀 Project: Credit Card Fraud Detection using Machine Learning
<br>
<B>Overview</B><br>
This project focuses on detecting fraudulent credit card transactions using machine learning models. Given the severe consequences of fraud, a robust predictive model is essential for financial security. The dataset is highly imbalanced, requiring advanced techniques to ensure accurate fraud detection.
<br>
We apply Random Forest and XGBoost, two powerful models, along with oversampling techniques (ROSE) to handle class imbalance.<br> The effectiveness of our models is evaluated using confusion matrices, ROC curves, and AUC scores.
<br>
 ### Objectives<br>
✔ Preprocess the dataset, handling missing values and imbalanced classes.<br>
✔ Balance the dataset using ROSE (Random Over-Sampling Examples).<br>
✔ Train and evaluate machine learning models (Random Forest & XGBoost).<br>
✔ Analyze performance using confusion matrices, AUC scores, and ROC curves.<br>
<br>
📊 Data Preprocessing & Class Imbalance Handling
<br>
✔ Checked missing values and removed inconsistencies.<br>
✔ Visualized the distribution of fraud vs non-fraud transactions.<br>
✔ Used ROSE to balance the dataset, ensuring that minority (fraudulent) cases are properly represented in training.
<br>
📌<B> Key Finding: </B>
<br>
Before balancing, the dataset was heavily skewed toward non-fraudulent transactions. Using ROSE significantly improved model learning by creating a more balanced dataset.
<br>
Machine Learning Models Used<br>
1️⃣ Random Forest Classifier<br>
Ensemble-based model that improves accuracy and reduces overfitting.<br>
Feature importance ranking helps identify key fraud indicators.<br>
Evaluated using confusion matrix and accuracy score.
<br>
📌<B> Key Findings:</B><br> 
The Random Forest model performed well, effectively identifying fraudulent cases with high precision and recall.
<br>
2️⃣ XGBoost (Extreme Gradient Boosting)<br>
A highly efficient boosting algorithm optimized for structured data.<br>
Trained on the balanced dataset with 100 boosting rounds.<br>
Evaluated using ROC curve and AUC score.<br>
📌<B> Key Findings:</B> 
<br>XGBoost outperformed Random Forest, achieving a higher AUC score, indicating a better separation between fraudulent and non-fraudulent transactions.
<br>
📈 Performance Evaluation<br>
✔ Confusion Matrices – Showed significant improvement in fraud detection after balancing the dataset.<br>
✔ AUC-ROC Curve – Used to measure the true positive rate vs false positive rate.<br>
✔ Feature Importance – Identified key transaction features contributing to fraud detection.
<br>
📌<B> Key Findings:</B><br> The XGBoost model achieved the highest AUC score, indicating superior fraud detection capability.
