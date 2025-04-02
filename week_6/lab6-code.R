# -------------------------------------------------------------
# PROBLEM 1: Birth weight for boys (Textbook page 311, Exercise 6.28)
# -------------------------------------------------------------

# In the United States, the mean birth weight for boys is 3.41 kg, 
# with a standard deviation of 0.55 kg.

# Assuming that the distribution of birth weight is normal, 
# find the following using pnorm(), qnorm() commands. 

# (a) i.) What is the z-score for a baby boy that weighs 1.5 kg? Interpret this z-score.
z_score <- (1.5 - 3.41) / 0.55
z_score

# (a) ii.) What proportion of baby boys in the United States are born with a low birth weight?
p_low_weight <- pnorm(z_score)
p_low_weight

# (b) Find the probability a baby boy is born with a typical birth weight 
# (between 2.5 kg and 4.0 kg).

p_typical <- pnorm(4.0, mean = 3.41, sd = 0.55) - pnorm(2.5, mean = 3.41, sd = 0.55)
p_typical

# (c) Matteo weighs 3.6 kg at birth. What proportion of baby boys are heavier than Matteo?
p_heavier <- pnorm(3.6, mean = 3.41, sd = 0.55, lower.tail = FALSE)
p_heavier

# (d) What is the probability that a randomly selected baby boy is exactly 3 kg?
# (For continuous distributions, P(X = x) = 0)

# (e) Repeat (a) using pounds instead of kg. Mean = 7.52 lb, SD = 1.21 lb, weight = 3.31 lb.
z_score_lb <- (3.31 - 7.52) / 1.21
z_score_lb

# -------------------------------------------------------------
# Problem 2: Multiple-choice question
# -------------------------------------------------------------

# Which of the following is true? 

# (i) Z-score can’t be 0.
# FALSE, think about what happens at u = x

# (ii) Z-score measures the number of standard deviations x is away from the mean.
# TRUE, try an example

# (iii) Z-score has the same unit as x.
# z score is unitless as seen in last problem

# (iv) You need to use R command pnorm() to calculate z-score.
# If we know percentile (or probability), we use qnorm to find z-score


# -------------------------------------------------------------
# Problem 3: Binomial distribution (Textbook page 321, Exercise 6.41, modified)
# -------------------------------------------------------------

# A quiz in a statistics course has four multiple-choice questions,each with five possible answers.
# A passing grade is three or more correct answers. Abraham randomly guesses.

# (a) Define the distribution of X
# X ~ binom(n = 4, p = 1/5)

# (b) Probability that Abraham answers all four questions correctly.
p_all_correct <- dbinom(4, size = 4, prob = 1/5)
p_all_correct

# (c) Probability that Abraham passes the quiz (gets 3 or more correct answers).
p_pass <- dbinom(3, size = 4, prob = 1/5) + dbinom(4, size = 4, prob = 1/5)
p_pass

# (d) What is the probability that all of three friends - Abraham, Benjamin, and Calvin - 
# pass the quiz if they randomly guess? 
# What assumption(s) do you have to make if any? 
p_all_pass <- p_pass^3
p_all_pass

# (e) A quiz has 20 questions, and students pass if they answer at least 15 correctly.
# What is the probability Dorian passes if he guesses randomly?
p_dorian_pass <- pbinom(14, size = 20, prob = 1/5, lower.tail = FALSE)
p_dorian_pass

# (f) Expected value and standard deviation of correct answers in a 20-question quiz.
E_Y <- 20 * (1/5)
E_Y
sd_Y <- sqrt(20 * (1/5) * (4/5))
sd_Y

# -------------------------------------------------------------
# PROBLEM 4
# -------------------------------------------------------------
survey <- read.csv(file.choose())       

# part 1: Histogram of High School GPA
hist(survey$hs.gpa, breaks = 20, 
     xlab= "High School GPA", 
     main="Distribution of High School GPA")

# part 2: Identify Students with High School GPA = 0
is.0 <- survey$hs.gpa == 0  # Returns TRUE for students with GPA = 0
table(is.0)  # Count of TRUE (GPA = 0) and FALSE (nonzero GPA)

# part 3: Removing GPA = 0 and Examining Q-Q Plot
hs.gpa.new <- survey$hs.gpa[survey$hs.gpa > 0]

# Q-Q plot to check normality
qqnorm(hs.gpa.new, main="Q-Q Plot of High School GPA (After Removing 0)")
qqline(hs.gpa.new, col = "red")

# part 4: Interpretation (included in comments)
# - Histogram shows left skew and GPA capped at 4.0.
# - Q-Q plot confirms left skew, and many students have GPA = 4.0.
# - Removing GPA = 0 improves normality, but distribution is still skewed.





