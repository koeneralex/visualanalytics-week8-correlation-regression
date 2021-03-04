## Instructions ----------------

  # Create your own visual analytics based on correlation or regression analysis using ggplot2.
  
  # The visual will follow our textbook recommendation to use grid to enhance the comparisons between scatter plots or your variables.


## Libraries -------------------

library(datasets) # Data sets
library(tidyverse) # Ggplot/dplyr
library(reshape2) # Aggregating


## Correlation & Regression Analysis ----

# Get data
data("USArrests")
df <- USArrests

# Create linear model.
m1 <- lm(Rape~UrbanPop, df)
summary(m1)
# R-squared  = 0.1519

# Predicts values of outcome variable based on predictor variables value.
test1 <- data.frame(UrbanPop=100) # If population is 100, what is amount of rapes?
predict(m1, test1, type="response")  

# Test if population is 200, what is amount of rapes?
test1 <- data.frame(UrbanPop=200)
predict(m1, test1, type="response")

# Plot urban population (independent variable) on x-axis and Rape (dependent variable) on y-axis to visualize relationship.
ggplot(df, aes(x=UrbanPop, y=Rape)) +
  geom_point() +
  geom_smooth(formula="y~x", method="lm") +
  labs(title="US Rapes by Urban Population", x="Population in Thousands", y="Rapes Commited")


## Additional Visualizations ------

dfCor <- as.data.frame(melt(cor(df)))

qplot(x=Var1, y=Var2, fill=value, data=dfCor, geom="tile") +
  labs(title="US Arrests Correlation Analysis", x="Variable 1", y="Variable 2")






