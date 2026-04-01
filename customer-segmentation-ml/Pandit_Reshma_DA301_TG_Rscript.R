## LSE Data Analytics Online Career Accelerator 
# DA301:  Advanced Analytics for Organisational Impact

###############################################################################

# Assignment 5 scenario
## Turtle Games’s sales department has historically preferred to use R when performing 
## sales analyses due to existing workflow systems. As you’re able to perform data analysis 
## in R, you will perform exploratory data analysis and present your findings by utilising 
## basic statistics and plots. You'll explore and prepare the data set to analyse sales per 
## product. The sales department is hoping to use the findings of this exploratory analysis 
## to inform changes and improvements in the team. (Note that you will use basic summary 
## statistics in Module 5 and will continue to go into more detail with descriptive 
## statistics in Module 6.)

################################################################################

## Assignment 5 objective
## Load and wrangle the data. Use summary statistics and groupings if required to sense-check
## and gain insights into the data. Make sure to use different visualisations such as scatterplots, 
## histograms, and boxplots to learn more about the data set. Explore the data and comment on the 
## insights gained from your exploratory data analysis. For example, outliers, missing values, 
## and distribution of data. Also make sure to comment on initial patterns and distributions or 
## behaviour that may be of interest to the business.

################################################################################

# Module 5 assignment: Load, clean and wrangle data using R

## It is strongly advised that you use the cleaned version of the data set that you created and 
##  saved in the Python section of the course. Should you choose to redo the data cleaning in R, 
##  make sure to apply the same transformations as you will have to potentially compare the results.
##  (Note: Manual steps included dropping and renaming the columns as per the instructions in module 1.
##  Drop ‘language’ and ‘platform’ and rename ‘remuneration’ and ‘spending_score’) 

## 1. Open your RStudio and start setting up your R environment. 
## 2. Open a new R script and import the turtle_review.csv data file, which you can download from 
##      Assignment: Predicting future outcomes. (Note: You can use the clean version of the data 
##      you saved as csv in module 1, or, can manually drop and rename the columns as per the instructions 
##      in module 1. Drop ‘language’ and ‘platform’ and rename ‘remuneration’ and ‘spending_score’) 
## 3. Import all the required libraries for the analysis and view the data. 
## 4. Load and explore the data.
##    - View the head the data.
##    - Create a summary of the new data frame.
## 5. Perform exploratory data analysis by creating tables and visualisations to better understand 
##      groupings and different perspectives into customer behaviour and specifically how loyalty 
##      points are accumulated. Example questions could include:
##    - Can you comment on distributions, patterns or outliers based on the visual exploration of the data?
##    - Are there any insights based on the basic observations that may require further investigation?
##    - Are there any groupings that may be useful in gaining deeper insights into customer behaviour?
##    - Are there any specific patterns that you want to investigate
## 6. Create
##    - Create scatterplots, histograms, and boxplots to visually explore the loyalty_points data.
##    - Select appropriate visualisations to communicate relevant findings and insights to the business.
## 7. Note your observations and recommendations to the technical and business users.

###############################################################################

# Your code here.

# Load libraries
library(tidyverse)  # Data manipulation & visualisation
library(corrplot)   # Correlation plots
library(moments)    # Skewness & kurtosis

# Preview the dataset structure and first few rows
data <- read.csv('turtle_reviews_clean.csv')

# Summary statistics provide a high-level sense-check of ranges and distributions
summary(data) 

# Check for missing values across all columns
colSums(is.na(data))

# Confirm data types (important for modelling decisions)
column_data_types <- sapply(data, class)
print(column_data_types)

# The dataset contains 2,000 observations with no missing values. 
# Key numeric variables include age, remuneration, spending score, and loyalty points,
# making the data suitable for exploratory analysis and regression modelling.

# Perform exploratory data analysis

# Distribution of Spending Scores
ggplot(data, aes(x = spending_score)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Spending Scores",
       x = "Spending Score",
       y = "Count")

# Spending scores are evenly distributed,indicating a balanced customer base.

# Distribution of Remuneration
ggplot(data, aes(x = remuneration)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Remuneration",
       x = "Remuneration",
       y = "Count")

# Count of remuneration suggests a mild right skew and a smaller number of high-income customers.

# Distribution of Age
ggplot(data, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Age",
       x = "Age",
       y = "Count")

# Count of customer age is dominantly around middle adulthood (30-40 years),
# consistent with a working-age customer base.

# Loyalty points by spending group
data %>%
  mutate(spend_group = cut(spending_score,
                           breaks = c(0, 30, 60, 100),
                           labels = c("Low", "Medium", "High"))) %>%
  group_by(spend_group) %>%
  summarise(
    avg_loyalty = mean(loyalty_points),
    count = n()
  )
# Higher spending groups accumulate substantially more loyalty points.

# Boxplot- Loyalty Points by Education Level
ggplot(data, aes(x = education, y = loyalty_points)) +
  geom_boxplot() +
  labs(title = "Loyalty Points by Education Level",
       x = "Education",
       y = "Loyalty Points")
# Loyalty accumulation is seen at all education levels, and is slightly higher at the basic level,
# however, outliers with high loyalty points are more often seen in the higher education tiers.  

dev.off() # to mitigate graphics errors

# Scatterplot of Loyalty points vs Spending
data %>%
  ggplot(aes(spending_score, loyalty_points)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  labs(title = "Spending Score vs Loyalty Points")

# A positive linear relationship can be seen between spending score and loyalty points,
# however, the data seems to show a fork and hence a wide spread beyond spending score > 60.

# Scatterplot of Loyalty points vs Remuneration
data %>%
  ggplot(aes(remuneration, loyalty_points)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  labs(title = "Remuneration vs Loyalty Points")

# A positive linear relationship can be seen between remuneration and loyalty points,
# however, the data seems to show a fork and hence a wide spread beyond remuneration > 50.

# Scatterplot of Loyalty points vs Age
data %>%
  ggplot(aes(age, loyalty_points)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  labs(title = "Age vs Loyalty Points")

# No clear relationship is seen between age and loyalty points.


# Product-level summary statistics
product_summary <- data %>%
  group_by(product) %>%
  summarise(
    customers = n(),
    avg_loyalty = mean(loyalty_points),
    median_loyalty = median(loyalty_points),
    avg_spending = mean(spending_score),
    avg_remuneration = mean(remuneration)
  ) %>%
  arrange(desc(avg_loyalty))

# View top products by average loyalty
head(product_summary, 10)

# Boxplot of loyalty points by product
ggplot(data, aes(x = factor(product), y = loyalty_points)) +
  geom_boxplot(outlier.alpha = 0.3) +
  labs(
    title = "Distribution of Loyalty Points by Product",
    x = "Product Code",
    y = "Loyalty Points"
  ) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

# Top and bottom products by loyalty performance
top_products <- product_summary %>%
  slice_max(avg_loyalty, n = 10)

top_products

bottom_products <- product_summary %>%
  slice_min(avg_loyalty, n = 10)

bottom_products

# Average spending score by product
ggplot(product_summary, aes(x = avg_spending, y = avg_loyalty)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_smooth(method = "lm") +
  labs(
    title = "Average Loyalty Points vs Average Spending Score by Product",
    x = "Average Spending Score",
    y = "Average Loyalty Points"
  )

# Some products generate substantially more loyalty points than others.
# On average, products with a higher spending score are more positively related to higher average loyalty points.

###############################################################################
###############################################################################

# Assignment 6 scenario

## In Module 5, you were requested to redo components of the analysis using Turtle Games’s preferred 
## language, R, in order to make it easier for them to implement your analysis internally. As a final 
## task the team asked you to perform a statistical analysis and create a multiple linear regression 
## model using R to predict loyalty points using the available features in a multiple linear model. 
## They did not prescribe which features to use and you can therefore use insights from previous modules 
## as well as your statistical analysis to make recommendations regarding suitability of this model type,
## the specifics of the model you created and alternative solutions. As a final task they also requested 
## your observations and recommendations regarding the current loyalty programme and how this could be 
## improved. 

################################################################################

## Assignment 6 objective
## You need to investigate customer behaviour and the effectiveness of the current loyalty program based 
## on the work completed in modules 1-5 as well as the statistical analysis and modelling efforts of module 6.
##  - Can we predict loyalty points given the existing features using a relatively simple MLR model?
##  - Do you have confidence in the model results (Goodness of fit evaluation)
##  - Where should the business focus their marketing efforts?
##  - How could the loyalty program be improved?
##  - How could the analysis be improved?

################################################################################

## Assignment 6 assignment: Making recommendations to the business.

## 1. Continue with your R script in RStudio from Assignment Activity 5: Cleaning, manipulating, and 
##     visualising the data.
## 2. Load and explore the data, and continue to use the data frame you prepared in Module 5.
## 3. Perform a statistical analysis and comment on the descriptive statistics in the context of the 
##     review of how customers accumulate loyalty points.
##  - Comment on distributions and patterns observed in the data.
##  - Determine and justify the features to be used in a multiple linear regression model and potential
##.    concerns and corrective actions.
## 4. Create a Multiple linear regression model using your selected (numeric) features.
##  - Evaluate the goodness of fit and interpret the model summary statistics.
##  - Create a visual demonstration of the model
##  - Comment on the usefulness of the model, potential improvements and alternate suggestions that could 
##     be considered.
##  - Demonstrate how the model could be used to predict given specific scenarios. (You can create your own 
##     scenarios).
## 5. Perform exploratory data analysis by using statistical analysis methods and comment on the descriptive 
##     statistics in the context of the review of how customers accumulate loyalty points.
## 6. Document your observations, interpretations, and suggestions based on each of the models created in 
##     your notebook. (This will serve as input to your summary and final submission at the end of the course.)

################################################################################

# Your code here.

# Spending score reflects customer engagement and purchasing behaviour, 
# while remuneration represents purchasing capacity.
# Both variables showed moderate positive correlation with loyalty points 
# and exhibited approximately linear relationships, 
# making them suitable predictors for a multiple linear regression model.

# Correlation

# Select numeric columns only (exclude character columns like 'summary')
numeric_data <- data %>% select(where(is.numeric))

# Calculate the correlation matrix using complete observations (rows with complete data and no nulls)
correlation_matrix <- cor(numeric_data, use = "complete.obs")


# Reset plotting device to avoid margin calculation issues
plot.new()
dev.off()

# Correlation plot with smaller labels
corrplot(
  correlation_matrix,
  method = "circle",
  tl.cex = 0.6,      
  tl.col = "black",
  number.cex = 0.6
)

# View numeric correlation values
correlation_matrix

# Spending score (r ≈ 0.67) and remuneration (r ≈ 0.62) show strong positive correlations with loyalty points, 
# while age shows only a weak relationship

# Pair plots to visualize relationships
pairs(data[, c('age', 'remuneration', 'spending_score', 'loyalty_points')])

# Measures of Shape

# Shapiro-Wilk test for normality
shapiro.test(data$loyalty_points)

# The significant result indicates loyalty points are not normally distributed. 
# However, linear regression is robust to non-normal outcomes for this sample size (n = 2000).

# Skewness and Kurtosis
skewness(data$loyalty_points)
kurtosis(data$loyalty_points)

# Positive skewness and elevated kurtosis indicate a long right tail driven by high-loyalty customers.

# Calculate Range
range_loyalty <- range(data$loyalty_points)

# Calculate Difference between highest and lowest values
difference_high_low <- diff(range_loyalty)

# Calculate Interquartile Range (IQR)
iqr_loyalty <- IQR(data$loyalty_points)

# Calculate Variance
variance_loyalty <- var(data$loyalty_points)

# Calculate Standard Deviation
std_deviation_loyalty <- sd(data$loyalty_points)

# Display results
list(
  Range = range_loyalty,
  Difference = difference_high_low,
  IQR = iqr_loyalty,
  Variance = variance_loyalty,
  Standard_Deviation = std_deviation_loyalty
)

# More Measures of Shape

scores <- data$loyalty_points

# Calculate mean, median, and mode
mean_score <- mean(scores)
median_score <- median(scores)
mode_score <- as.numeric(names(sort(table(scores), decreasing = TRUE)[1]))

# Print the results
cat("Mean:", mean_score, "\n")
cat("Median:", median_score, "\n")
cat("Mode:", mode_score, "\n")

# Loyalty points vary widely, suggesting opprtunities for customer segmentation.

# Multiple Linear Regression

# Create the multiple linear regression models
model <- lm(loyalty_points ~ spending_score + remuneration, data = data)

# Summarize the model
summary(model)

# Based on the adjusted R-squared, the model explains ~83% of the variance in loyalty points. 
# Both predictors and F-statistic are highly significant,
# indicating suitability of this model to predict loyalty points based on  spending behaviour and remuneration.


# Extended model including age to test the model
model1 <- lm(loyalty_points ~ spending_score + remuneration + age, data = data)

# Summarize the model
summary(model1)

# Age is not independently significantly correlated with loyalty points but 
# is seen to be statistically significant in this MLR model
# However, adjusted R-squared increases only by ~1.3 percentage points
# To avoid complexity, the final model retained only spending score and remuneration as predictors.

# Visualising the model

# Actual vs predicted loyalty points
ggplot(data, aes(x = loyalty_points, y = predict(model, data))) +
  geom_point() +
  stat_smooth(method = "loess") +  
  labs(x = 'Actual Loyalty Score', y = 'Predicted Loyalty Score') +
  ggtitle('Actual vs. Predicted Loyalty Score')

# Residual diagnostics

par(mfrow = c(2,2))
plot(model)

# Residuals show mild non-linearity at extreme values, suggesting model limitations in extreme cases.

# Predicting with new data (Business case)

# New customer scenarios:
# Customer 1: remuneration = 80, spending_score = 85
# Customer 2: remuneration = 25, spending_score = 40

new_customers <- tibble(
  remuneration = c(80, 25),
  spending_score = c(85, 40)
)

# Predict loyalty points for new customers
predict(model, new_customers, interval = "confidence")


# Model predicts high loyalty points for High-spend, high-income customers as also seen in the actual dataset.
# These predictions can help Turtle Games estimate loyalty points for new customers.

###############################################################################
###############################################################################




