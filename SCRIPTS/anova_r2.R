# In this script, we run Analysis of Variance (ANOVA) on the sentiment scores grouped by attributes and conduct linear regression and examine the value of R-squared.

library(tidyverse) # load required package

# ANOVA - checking if sentiment varies across price categories
data <- read.csv("C:\\Users\\benvo\\OneDrive - University of Virginia\\Desktop\\DS 4002\\Project 1\\Clean Data\\reviews_with_sentiment.csv")

price_summary <- summary(data$price)

data <- data %>%
  mutate(price_quartiles = cut(price, breaks = c(0, price_summary[[2]], price_summary[[3]], price_summary[[4]], Inf), labels = c("1st", "2nd", "3rd", "4th")))

anova_cleanliness <- aov(cleanliness_sent_compound ~ price_quartiles, data = data)
summary(anova_cleanliness)

anova_location <- aov(location_sent_compound ~ price_quartiles, data = data)
summary(anova_location)

anova_safety <- aov(safety_sent_compound ~ price_quartiles, data = data)
summary(anova_safety)

anova_overall <- aov(overall_sent_compound ~ price_quartiles, data = data)
summary(anova_overall)



# linear regression
lm_cleanliness <- lm(cleanliness_sent_compound ~ price, data = data)
summary(lm_cleanliness)

lm_location <- lm(location_sent_compound ~ price, data = data)
summary(lm_location)

lm_safety <- lm(safety_sent_compound ~ price, data = data)
summary(lm_safety)

lm_overall <- lm(overall_sent_compound ~ price, data = data)
summary(lm_overall)

