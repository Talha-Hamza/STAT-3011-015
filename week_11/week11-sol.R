# WEEK 11 Lab Handout
# STAT 3011

#------------------------------------------------------------------------------
# Problem 1. solved in slides

#------------------------------------------------------------------------------
# Problem 2. Estimate average difference between weekday and weekend sleep hours for all college students.
# Use the class survey data (survey_S25.csv). Assume that this data set represents a random sample of college students.

survey <- read.csv("http://users.stat.umn.edu/~parky/survey_S25.csv")

# Check the exact names of variables
names(survey)
head(survey) # print 6 rows

#a)
# Make (i) a side-by-side boxplot of weekday and weekend (ii) boxplot of difference of sleep hours 
# for each students where d = weekend - weekday sleep hours. Do you think there is any difference 
# between students weekday and weekend average sleep hours?

#i 
# boxplot(var1, var2)
boxplot(survey$time.sleep.weekend, survey$time.sleep.weekday, 
        names = c("Weekend", "Weekday"), main="Sleep hours")
#ii
# Difference = Weekend - Weekday or weekday - weekend sleep hours
diff <- survey$time.sleep.weekend-survey$time.sleep.weekday
boxplot(diff, main=" D=Weekend-weekday sleep hours")
boxplot(diff, main="Difference in sleep hours, with ylim", ylim=c(-1, 4))

# Note: From the boxplot of difference, most of difference is positive, D = weekend - weekday > 0, 
# meaning that students tend to sleep more on weekends than weekdays.

# b)
# Construct a 99% confidence interval for mean of difference between students weekday and weekend 
# sleep hours. Interpret it in the context of the problem. Since students weekday and weekend 
# sleep hours match, it is paired data.

t.test(survey$time.sleep.weekday, survey$time.sleep.weekend, conf.level = 0.99, 
       alternative = "two.sided", paired = TRUE)

# We are 99% confident that mean of difference in sleep hours 
# Difference = weekday−weekend is between - 1.5 and - 1.15. 
# In other word, we are 99% confident that students sleep hours 
# 1.15 to 1.56 hours longer on weekend than weekday on average

#------------------------------------------------------------------------------
# Problem 3: Test Ha: D < 0 where D = weekday - weekend.
# Use the same data to test whether on average students sleep less on weekdays (or sleep more on weekends). 
# Report the test statistic and p-value. Use α = 0.05.

t.test(x = survey$time.sleep.weekday, y = survey$time.sleep.weekend, 
       alternative = "less", paired = TRUE)

# Test stat: t = -17.008
# P-value: 2.2e-16
# Conclusion: Reject H0; and Accept Ha

# Problem 3 follow up question:
# Is the result statistically significant? Is it practically significant?

# P-value is small, hence it is statistically significant

#------------------------------------------------------------------------------
# Problem 4: Compare weekday sleep hours of senior and Freshman.
# Construct a 95% confidence interval for difference between two population means. 
# Interpret the result. Based on the confidence interval, can we conclude that 
# Freshman students sleep more on average than senior students?

survey <- read.csv("http://users.stat.umn.edu/~parky/survey_S25.csv")

# Extract sleep hours for seniors and freshmen
zzz.sr <- survey$time.sleep.weekday[survey$year == "Senior"]
zzz.fr <- survey$time.sleep.weekday[survey$year == "Freshman"]

# Calculate sample means
mean(zzz.sr)  # Senior mean sleep hours = 7.1
mean(zzz.fr)  # Freshman mean sleep hours = 7.313

# Perform t-test for difference in means
t.test(zzz.fr, zzz.sr, conf.level = 0.95, alternative = "two.sided")

# Results:
# 95% CI for difference (Freshman - Senior): (-0.234, 0.660)

# Interpretation: We are 95% confident that the true difference between mean sleep hours 
# for freshman and senior is between -0.23 hours and 0.66 hours.
# Since the CI includes 0, we cannot conclude there's a significant difference.

# Optional: Using tapply to get summary statistics by year
tapply(survey$time.sleep.weekday, survey$year, mean)  # Group means
tapply(survey$time.sleep.weekday, survey$year, sd)    # Group standard deviations
tapply(survey$time.sleep.weekday, survey$year, length) # Group sample sizes

#------------------------------------------------------------------------------
# Problem 5: Test whether Freshmen students sleep more than Seniors on average (α = 0.01)
# State the null and alternative hypothesis. Report test statistic and p-value, draw conclusion.

# Hypotheses:
# H0: μ_fr = μ_sr  (No difference in mean sleep hours)
# Ha: μ_fr > μ_sr  (Freshmen sleep more than seniors)

# Perform one-sided t-test
t.test(x = zzz.fr, y = zzz.sr, alternative = "greater")

# Results:
# Test statistic (t*) = 0.96778
# p-value = 0.1699 
# Degrees of freedom = 34.898

# Alternative specification (equivalent test): NOTE the order of x and y
t.test(x = zzz.sr, y = zzz.fr, alternative = "less")

# Conclusion:
# The p-value (0.1699) is greater than α = 0.01, 
# therefore we fail to reject the null hypothesis.

# We don't have enough evidence to conclude that the population mean sleep hours 
# for freshman is greater than the mean sleep hours of seniors at the 0.01 significance level.
