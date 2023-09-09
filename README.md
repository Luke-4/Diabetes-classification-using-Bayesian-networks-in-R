# Diabetes-classification-using-Bayesian-networks-in-R

## Project Overview

This project focuses on leveraging Bayesian networks for early diagnosis of diabetes based on a set of symptoms. Diabetes is a pervasive and debilitating condition, affecting millions worldwide and posing significant health risks. It can lead to severe complications, including heart disease, stroke, kidney problems, vision loss, and neuropathy, severely impacting the quality of life for those affected.

Our study involves a comparative analysis between Bayesian network models and a widely-used control model, Random Forest. Bayesian networks are particularly promising in improving early diagnosis, which is crucial for timely intervention and treatment.

The Bayesian networks in our analysis incorporate several key risk factors as nodes, including age, BMI (Body Mass Index), cholesterol level, blood pressure, and previous stroke history, among others. These factors have been linked to diabetes, and by including them as nodes in our models, we aim to improve the accuracy of diabetes prediction. Below is an organized breakdown of the project's key components and features:

### Data Preprocessing

Before diving into machine learning models, it's essential to preprocess the data to ensure its quality and suitability for analysis. The following steps have been taken:

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

To assess the performance of the machine learning models, the following evaluation metrics have been utilized:

1. **Precision**

2. **Recall**

3. **F1-Score**

4. **Specificity**
