# Week 13 ANOVA and Tukey's HSD
# STAT 3011
# Spring 2025

# -------------------------------------------------------------------------
# Study Background:
# An airline has a toll-free telephone number that potential customers can call 
# to make flight reservations. Usually, the call volume is heavy, and callers 
# are placed on hold until an agent is free to answer. Researchers working for 
# the airline recently conducted a randomized experiment to analyze whether callers 
# would remain on hold longer if they heard:
# 1. an advertisement about the airline and its current promotions,
# 2. recorded Muzak ("elevator music"), or
# 3. recorded classical music.
# Messages are five minutes long and then repeated.

# We will build a one-way ANOVA model for this lab. 
# Import the dataset:
dat <- read.csv("http://users.stat.umn.edu/~parky/hold.csv")

# -------------------------------------------------------------------------
# Part 1: Data Exploration

# Problem 1: Check variable names and identify variables
names(dat)
head(dat)
str(dat)
summary(dat)

# Explanatory variable: message (type of recorded message)
# Response variable: time (holding time in minutes)

# Problem 2: Construct side-by-side boxplot and make prediction
boxplot(dat$time ~ dat$message, 
        main = "Holding Times by Message Type",
        xlab = "Message Type", 
        ylab = "Holding Time (minutes)")

# Problem 3: Identify sample sizes and group means, and grand mean
table(dat$message)  # Frequency table
# g = 3, n1 = 5, n2 = 5, n3 = 5, N = 15

tapply(dat$time, dat$message, mean)  # Group means
# y_bar1 = 5.4, ̄y_bar2 = 10.4, y_bar3 = 2.8
mean(dat$time)  # Grand mean (y_bar) = 6.2

tapply(dat$time, dat$message, sd)  # Group standard deviations

# -------------------------------------------------------------------------
# Part 2: ANOVA F-test

# Problem 4: State ANOVA assumptions
# 1. Independent random samples
# 2. Normally distributed populations
# 3. Equal population variances

# Problem 5: State hypotheses
# H0: μ1 = μ2 = μ3 (all population means are equal)
# H1: Not all population means are equal

# Problem 6: Conduct ANOVA test
m1 <- aov(time ~ message, data = dat)
summary(m1)

# ANOVA table results:
# Group df (G-1): 2
# Error df (N-G): 12
# F-statistic: 6.431
# p-value: 0.0126

# Distribution under H0: F ~ F(2,12) under H0

# Conclusion:
# P-value (0.0126) < a (0.05), so we reject H0.
# We conclude that at least two population mean holding times are different.

# Problem 6 Part 4: Causation
# Since this was a randomized experiment and assumptions are met,
# we can conclude that message type causes differences in wait times.

# -------------------------------------------------------------------------
# Part 3: Tukey's Honest Significant Difference

# Problem 7: Perform Tukey HSD test
TukeyHSD(m1, "message", conf.level = 0.95)

# Significant pairs:
# muzak-classical (p = 0.01 < 0.05)

# Problem 8: Interpret results
# CI for classical−advertisement: (-0.74, 10.74) → Not significant (contains 0)
# CI for muzak−advertisement: (-8.34, 3.14) → Not significant (contains 0)
# CI for muzak−classical: (-13.34, -1.8) → Significant (does not contain 0)

# Conclusion:
# Only the muzak-classical comparison shows statistically significant difference.
# Callers hearing muzak wait significantly longer than those hearing classical music.