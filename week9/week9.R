# Problem 1: Finding t-multipliers for confidence intervals

# a) Find the t-multiplier for a 92% confidence interval 
#    with sample size n = 9
#    (Assume random sample and normal population assumptions are met)

# Hint: Use qt() function with appropriate arguments


# b) Find the t-multiplier for a 98% confidence interval
#    with sample size n = 1982
#    (Assume random sample assumption is met)


# Problem 2: Confidence interval for mean college GPA using survey data

# First, import the survey data:
survey <- read.csv("http://users.stat.umn.edu/~parky/survey_S25.csv")

# a) Identify the exact variable name for college GPA in the dataset


# b) Calculate the components needed for a confidence interval:
#    - Sample size (n)
#    - Sample mean (x̄)
#    - Sample standard deviation (s)
#    - Standard error (SE)
#    - Error Probability Alpha of 96% CI: in the long run, what proportion of 
#      times does this method produce a CI that DOESN'T contain the true parameter.
#    - t-multiplier for 96% CI
#    - Margin of error


# c) Construct a 96% confidence interval manually using the formula:
#    x̄ ± t_(α/2) * (s/√n)


# d) Check the normality assumption:
#    - Create a Q-Q plot
#    - Add a reference line
#    - (Optional) Create a histogram
#    - Based on the plots, is the normality assumption reasonable?


# e) Construct a 96% CI using t.test() function
#    - Compare with your manual calculation
#    - How would you interpret this interval?


# f) What happens if we increase confidence level to 99%?
#    - Construct a 99% CI using t.test()
#    - Compare with the 96% CI
#    Which of these statements is FALSE?
#    (i) Margin of error increases
#    (ii) Width of interval increases
#    (iii) Standard error increases
#    (iv) Point estimate doesn't change
