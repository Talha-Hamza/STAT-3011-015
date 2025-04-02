# Week 10 Lab
# Stat 3011
# Spring 2025


# Problem 1: For each of the following, state the parameter of interest, 
# and null and alternative hypothesis using statistical notations.

# a) The Ford Motor Company claims that its 2017 model of the Ford Escape 
# averages 30 miles per gallon for highway driving. A group of owners of 
# the 2017 Ford Escape model suspects that the company is exaggerating the 
# highway mile per gallon (mpg) and decides to conduct a test. After 50 
# test drives, they found a sample mean of 27 mpg.

# Parameter of interest: true population mean miles per gallon for highway 
# driving of Ford Escape 2017 model
# H0: μ = 30
# Ha: μ < 30
# (The group owners hopes to find evidence to support that the real mpg is 
# less than what company advertises)

# b) One study has suggested that students in college study an average of 
# 11 hours per week. Suppose you want to test whether college students who 
# plan to go to graduate school study more than 11 hours per week on average. 
# So you randomly selected 20 students who planned to go to graduate schools 
# and asked about their average study hours.

# Parameter of interest: population mean study hours per week for those who 
# plan to go to graduate school
# H0: μ = 11
# Ha: μ > 11


# Problem 2: Finding p-value.

# a) Ha: μ > 10, test statistic is t* = 3. If the sample size is 10, find the p-value.
pt(3, df = 9, lower.tail = FALSE)
# OR
1 - pt(3, df = 9)


# b) Ha: μ ≠ 10, test statistic is t* = 3. If the sample size is 10, find the p-value.
2 * pt(3, df = 9, lower.tail = FALSE)
# OR
2 * (1 - pt(3, df = 9))


# Problem 3: Exercise hours for Freshman students

# Import the class survey data
survey <- read.csv("http://users.stat.umn.edu/~parky/survey_S25.csv")

# Examine variable names
names(survey)
# Exact variable names are: time.exercise, year

# Frequency table of year variable
table(survey$year)
# Frequency table that contains the number of freshmen, juniors, etc.

# Identify freshmen
head(survey$year == "Freshman")
# The command checks whether each student is a freshman or not. 
# Only returns TRUE if a student is a freshman.
# head() lists only the first 6 outcomes.

# Extract exercise time for freshmen
head(survey$time.exercise[survey$year == "Freshman"])
# This outcome lists exercise time for freshman only. 
# Prints time.exercise if condition is met.

# Save Freshman students' exercise hours as x
x <- survey$time.exercise[survey$year == "Freshman"]

# Construct histogram
hist(x, main = "College Freshman exercise time", xlab = "Hours per day")

# Calculate descriptive statistics
mean(x)  # sample mean xbar
# [1] 1.337912
sd(x)    # sample standard deviation s
# [1] 0.9430842
length(x) # sample size n 
# [1] 91

# Conduct t-test (α = 0.01)
t.test(x, mu = 1, alternative = "greater", conf.level = 0.99)


# 5-step hypothesis test:

# 1. Assumptions:
# - Random sample assumption is not met (volunteer sample)
# - Normal population assumption is not met (data is skewed)
# - However, t-test is robust to non-normality with large n (n=91)

# 2. Hypotheses:
# H0: μ = 1
# Ha: μ > 1

# 3. Test statistic:
# Distribution: t-distribution with df = 90 (n-1 = 91-1)
# Value: t* = 3.418 (from t.test output)
# By hand: t* = (1.337912 - 1)/(0.9430842/sqrt(91)) ≈ 3.4

# Interpretation: The sample mean of 1.34 hours is 3.4 standard errors above 
# the hypothesized mean of 1 hour.

# 4. P-value:
p_value <- 1 - pt(3.418, df = 90)
p_value

# Interpretation: If H0 is true, probability of obtaining t* = 3.418 or more 
# extreme is 0.00047. Extremely unlikely if null is true.

# 5. Conclusion:
# p-value (0.00047) < α (0.01), so we reject H0.
# We have sufficient evidence to conclude that the population mean exercise 
# hours for freshman college students is greater than 1 hour per day.