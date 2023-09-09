# Diabetes-classification-using-Bayesian-networks-in-R

## Project Overview

This project focuses on leveraging Bayesian networks for early diagnosis of diabetes based on a set of symptoms. Diabetes is a pervasive and debilitating condition, affecting millions worldwide and posing significant health risks. It can lead to severe complications, including heart disease, stroke, kidney problems, vision loss, and neuropathy, severely impacting the quality of life for those affected.

Our study involves a comparative analysis between Bayesian network models and a widely-used control model, Random Forest. Bayesian networks are particularly promising in improving early diagnosis, which is crucial for timely intervention and treatment.

The Bayesian networks in our analysis incorporate several key risk factors as nodes, including age, BMI (Body Mass Index), cholesterol level, blood pressure, and previous stroke history, among others. These factors have been linked to diabetes, and by including them as nodes in our models, we aim to improve the accuracy of diabetes prediction. Below is an organized breakdown of the project's key components and features:

### Data Preprocessing

Before diving into the predictions, it's essential to preprocess the data to ensure its quality and suitability for analysis. The following steps have been taken:

1. **Resampling Techniques:** 
   - Random Under Sampler (Undersampling)
   - Random Over Sampler (Oversampling)

2. **Feature Engineering**
   - Discretization
   - Outlier Detection

3. **Feature Selection:** 
   - Recursive Feature Elimination Cross Validation with Random Forest Estimator 
   - Analysis of Feature Importance	
   - Domain Knowledge Approach
   - Correlation Analysis and Judgment

### Machine Learning Models

Here are the models implemented:

1. **Bayesian Networks**
   - Estimating the Structure	
   - PC Algorithm
   - HC Algorithm
   - Domain Knowledge Approach  

2. **Random Forest Classifier**

### Model Evaluation

To assess the performance of the models, the following evaluation metrics have been utilized:

1. **Precision**

2. **Recall**

3. **F1-Score**

4. **Specificity**

<hr></hr>

## Files

1. Read_data.R
   - Read original data
   - Outlier Detection
   - Discretization
   - Write to CSV to use in python
2. Preprocessing.R
   - Check for null values
   - Plot the correlation of each feature with the target variable
3. Resampling_and_RFE.ipynb
   - Resampling
   - RFECV Recursive feature elimination with cross-validation
   - Write to CSV to use in R
4. read_new_data.R
   - Read resampled data 
   - Drop discarted variables
5. PC_and_HC_for_BN.R
   - PC algorithm to create dag
   - Hill climbing algorithm to create dag 
6. BN_final.R
   - Create two manual dags, dag 3 and 4 in report 
   - Plot the dags
   - Fit the models on the training data
   - Predict on the testing set
   - Evaluate the predictions
7. RandomForest.R
   - Fit the Random Forest model on the training set
   - Predict on the test set 
   - Evaluate the results
