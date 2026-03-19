# CardioInsights AI – Heart Disease Prediction using Statistical Learning

## Overview

**CardioInsights AI** is a data analysis and machine learning project focused on **predicting the presence of heart disease** using clinical and demographic data.

Based on the Cleveland Heart Disease dataset, this project combines **statistical analysis, hypothesis testing, and predictive modeling** to identify key risk factors and build an interpretable model.

---

## 🎯 Objectives

- Analyze factors influencing heart disease
- Perform statistical hypothesis testing
- Select significant variables
- Build a predictive model using Logistic Regression
- Evaluate model performance using robust metrics

---

## 🛠️ Tech Stack

* [![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/) : Langage de base pour le scripting et l'analyse.
* [![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)](https://pandas.pydata.org/) & [![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)](https://numpy.org/) : Manipulation de données et calculs matriciels.
* [![Matplotlib](https://img.shields.io/badge/Matplotlib-013243?style=for-the-badge&logo=python&logoColor=white)](https://matplotlib.org/) / [![Seaborn](https://img.shields.io/badge/Seaborn-444444?style=for-the-badge&logo=python&logoColor=white)](https://seaborn.pydata.org/) : Visualisation de données et exploration statistique.
* [![Scikit-Learn](https://img.shields.io/badge/Scikit--learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white)](https://scikit-learn.org/) : Machine Learning supervisé et non-supervisé.
* [![Statsmodels](https://img.shields.io/badge/Statsmodels-013243?style=for-the-badge&logo=python&logoColor=white)](https://www.statsmodels.org/) : Modélisation statistique avancée et tests d'hypothèses.

---

## 📊 Dataset

- 📁 Source: Cleveland Heart Disease Dataset (Kaggle)
- 🧾 Type: Medical dataset
- 🎯 Target variable:
  - Presence of heart disease (1) / absence (0)

### 🔑 Key Features
- Age
- Sex
- Blood pressure
- Cholesterol
- Maximum heart rate
- Chest pain type
- Other clinical indicators

---

## 🔍 Data Analysis

### 📥 Data Loading & Exploration
- Dataset import and inspection
- Data structure analysis
- Descriptive statistics

### 📊 Univariate Analysis
- Distribution of heart disease cases
- Feature-wise analysis vs target variable

👉 Helps identify early patterns and correlations

---

## 🧪 Statistical Tests

This project goes beyond basic ML by applying **advanced statistical methods**:

- 📊 **ANOVA (TRV)** → impact of categorical variables  
- 📉 **Wald Test** → significance of model coefficients  
- 📈 **Chi-Square Test** → overall model significance  
- 🔬 **Partial F-Test (Generalized Wald)** → interaction effects  

👉 These tests ensure strong statistical validity of the model.

---

## 🧠 Feature Selection

- 🔽 Backward elimination method
- Based on **p-value significance**
- Identification of the most impactful variables

---

## 🤖 Model Development

### 📌 Logistic Regression

- Interpretable model
- Suitable for binary classification
- Based on selected variables

---

## 📈 Model Evaluation

The model performance is evaluated using:

- 📊 Confusion Matrix
- 📉 ROC Curve
- 🎯 Accuracy, Precision, Recall
- 🔍 Hosmer-Lemeshow Test (goodness of fit)

👉 Ensures both statistical and predictive reliability.
---

## 🧠 Key Insights

- Certain clinical features strongly influence heart disease prediction
- Statistical tests validate model assumptions
- Feature selection significantly improves performance
- Logistic regression remains a powerful interpretable model

---

## 🧠 Skills Demonstrated

- Data Analysis & Exploration
- Statistical Modeling
- Hypothesis Testing
- Feature Selection Techniques
- Predictive Modeling
- Model Evaluation

---

## 🏥 Real-World Impact

This project can support:

- 🏥 Early detection of heart disease
- 📊 Clinical decision support systems
- 🔬 Medical research and analysis

---

## 🔮 Future Improvements

- 🤖 Add advanced ML models (Random Forest, XGBoost)
- 🧠 Deep Learning models
- 🌐 Deploy as a web app (Streamlit)
- 📊 Integrate real-time medical data

---

## 💡 Motivation

This project reflects my ability to combine **data science, statistics, and real-world problem solving**.

It highlights the importance of interpretable AI in critical domains such as healthcare.

---