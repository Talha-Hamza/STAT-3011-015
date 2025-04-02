# Problem 1: Finding t-multipliers for confidence intervals

# a) Find the t-multiplier for a 92% confidence interval 
#    with sample size n = 9
#    (Assume random sample and normal population assumptions are met)
# Hint: Use qt() function with appropriate arguments
qt(1-(0.08/2), df = 9-1)
qt(0.04, df = 9-1, lower.tail = FALSE)

# b) Find the t-multiplier for a 98% confidence interval
#    with sample size n = 1982
#    (Assume random sample assumption is met)
qt(1-0.02/2, df = 1981)

# Problem 2: Confidence interval for mean college GPA using survey data

# First, import the survey data:
survey <- read.csv("http://users.stat.umn.edu/~parky/survey_S25.csv")

# a) Identify the exact variable name for college GPA in the dataset
names(survey)
x <- survey$c.gpa
head(x)

# b) Calculate the components needed for a confidence interval:
#    - Sample size (n)
n <- length(x)
#    - Sample mean (x̄)
x_bar <- mean(x)
#    - Sample standard deviation (s)
s = sd(x)
#    - Standard error (SE)
s_e <- s / sqrt(n)
#    - Error Probability Alpha of 96% CI: in the long run, what proportion of 
#      times does this method produce a CI that DOESN'T contain the true parameter.
a <- 0.04
#    - t-multiplier for 96% CI
t <- qt( 1- 0.04/2, df = n-1)
#    - Margin of error
moe <- t * s_e

# c) Construct a 96% confidence interval manually using the formula:
#    x̄ ± t_(α/2) * (s/√n)
x_bar + c(-1,1)*moe

# d) Check the normality assumption:
#    - Create a Q-Q plot
#    - Add a reference line
qqnorm(x)
qqline(x)
#    - (Optional) Create a histogram
#    - Based on the plots, is the normality assumption reasonable?
hist(x)

# e) Construct a 96% CI using t.test() function
#    - Compare with your manual calculation
#    - How would you interpret this interval?
t.test(x, conf.level = 0.96, alternative = "two.side")

# f) What happens if we increase confidence level to 99%?
#    - Construct a 99% CI using t.test()
t.test(x, conf.level = 0.99, alternative = "two.side")
#    - Compare with the 96% CI
#    Which of these statements is FALSE?
#    (i) Margin of error increases
# TRUE because MOE =  t_(α/2) * (s/√n) which increases as t-score increases.

#    (ii) Width of interval increases
# TRUE because MOE increases 

#    (iii) Standard error increases
# FALSE it stays the the same 

#    (iv) Point estimate doesn't change
# point estimate is the sample mean, and that remains
#  the same as long as the sample remains the same
