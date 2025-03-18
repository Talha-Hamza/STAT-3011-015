survey <- read.csv("https://raw.githubusercontent.com/Talha-Hamza/STAT-3011-015/main/survey_S25.csv")

# Step 2: Inspect the dataset
names(survey)  # Check the column names to identify the variable of interest
head(survey)   # View the first few rows of the dataset
x <- survey$num.sibling  # extract the num.sibling column
head(x)

mu <- mean(x, na.rm = TRUE)  # na.rm = TRUE to ignore missing values
sigma <- sd(x, na.rm = TRUE)

mu
sigma

hist(x, 
     main = "Population Distribution of Number of Siblings", # main title 
     xlab = "Number of Siblings", # give the x-asis a name
     xlim = c(0, 12))  # xlim sets the x-axis range from 0 to 12

set.seed(1)
sample(x, size = 5, replace = TRUE)

