# Customer Segmentation & Predictive Analytics
## Python and R | Regression, Clustering, NLP

## Overview

This project demonstrates an end-to-end machine learning and analytics 
workflow applied to customer behaviour data. Using Python and R in 
combination, the analysis addresses customer segmentation, loyalty point 
prediction, and sentiment analysis — producing actionable business 
recommendations from a structured analytical pipeline.

The project showcases the application of multiple analytical methods 
within a single reproducible workflow, including regression modelling, 
decision trees, k-means clustering, and NLP — skills directly transferable 
to population health and administrative data contexts.

## Research Questions

1. What factors drive loyalty point accumulation across customer segments?
2. Can customers be meaningfully segmented by income and spending behaviour?
3. What does sentiment analysis of customer reviews reveal about product 
   experience across segments?
4. Can a predictive model reliably estimate loyalty points from customer 
   demographics and spending data?

## Methods

**Python (Jupyter Notebook):**
- Data ingestion, schema validation, and cleaning using Pandas
- Exploratory Data Analysis — distributions, outlier detection, correlation
- Linear and multiple linear regression (statsmodels) with model 
  diagnostics (VIF, residuals, MAE, MSE, RMSE)
- Decision Tree Regressor (scikit-learn) with feature importance analysis 
  and pruning
- K-means clustering with Elbow and Silhouette methods for optimal k 
  selection — identified 5 distinct customer segments
- NLP: text preprocessing pipeline (contraction expansion, stopword 
  removal, tokenisation), VADER and TextBlob sentiment analysis, 
  word frequency and polarity analysis by cluster

**R Script:**
- Data validation and summary statistics (tidyverse)
- Multiple linear regression models — comparison of model specifications 
  with and without age as predictor
- Correlation plots (corrplot) and distributional analysis (moments)
- Model comparison and adjusted R² evaluation

## Key Findings

- Spending score and remuneration are the strongest predictors of loyalty 
  point accumulation (R² = 0.827 in final MLR model)
- Age is not independently significant as a predictor (p = 0.058)
- Five customer segments identified: Budget Essentials, Aspiring Spenders, 
  Balanced Shoppers, Premium Enthusiasts, Affluent Conservatives
- Decision tree retained strong explanatory power after pruning (R² ≈ 0.91)
- Overall customer sentiment is neutral to positive across all segments; 
  no significant quality or service concerns identified in reviews

## Repository Structure

```
├── Pandit_Reshma_DA301_Assignment_Notebook.ipynb  # Python analysis
├── Pandit_Reshma_DA301_Assignment_Rscript.R       # R analysis
├── Pandit_Reshma_DA301_Assignment_Report.pdf      # Technical report
├── Pandit_Reshma_DA301_Assignment_Presentation.pptx
└── README.md
```

## Skills Demonstrated

- **Python:** Pandas, Scikit-learn, Statsmodels, NLTK, TextBlob, 
  Matplotlib, Seaborn
- **R:** tidyverse, corrplot, moments — multiple regression and 
  distributional analysis
- End-to-end analytical pipeline: ingestion → cleaning → modelling → 
  visualisation → business recommendations
- ML methods: linear regression, decision trees, k-means clustering, NLP
- Dual-audience outputs: technical report and stakeholder presentation
- PEP 8 compliant, well-documented, reproducible code

## Assessment Feedback

*"Reshma, you delivered an excellent end-to-end analytics submission. 
Really great work! Your clustering and sentiment analyses showed a strong 
understanding of analytical diversity. Your R script was also well executed."*
— LSE/FourthRev Assessor

## How to Run

**Python:**
1. Install dependencies: `pip install pandas numpy matplotlib seaborn 
   scikit-learn statsmodels nltk textblob wordcloud contractions`
2. Open notebook in Jupyter and run all cells sequentially

**R:**
1. Install packages: `install.packages(c("tidyverse", "corrplot", "moments"))`
2. Run `Pandit_Reshma_DA301_Assignment_Rscript.R`

*Note: Raw data files are not included. The notebook and R script document 
the full analytical workflow for reproducibility.*
