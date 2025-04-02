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
mysample <- sample(x, size = 5, replace = TRUE)

mean(mysample)
sd(mysample)

xbar_n5 <- replicate(1000, mean(sample(x, size = 5, replace = TRUE)))
replicate(2, mean(sample(x, size=5, replace = TRUE)))


hist(xbar_n5, 
     main = "Sampling Distribution of Sample Mean (n = 5)", 
     xlab = "Sample Mean", 
     xlim = c(0, 12))


xbar_n50 <- replicate(1000, mean(sample(x, size = 50, replace = TRUE)))
xbar_n100 <- replicate(1000, mean(sample(x, size = 100, replace = TRUE)))
xbar_n200 <- replicate(1000, mean(sample(x, size = 200, replace = TRUE)))

par(mfrow = c(2, 2)) 

hist(xbar_n5, 
     main = "Sampling Distribution (n = 5)", 
     xlab = "Sample Mean", 
     xlim = c(0, 12))

hist(xbar_n50, 
     main = "Sampling Distribution (n = 50)", 
     xlab = "Sample Mean", 
     xlim = c(0, 12))

hist(xbar_n100, 
     main = "Sampling Distribution (n = 100)", 
     xlab = "Sample Mean", 
     xlim = c(0, 12))

hist(xbar_n200, 
     main = "Sampling Distribution (n = 200)", 
     xlab = "Sample Mean", 
     xlim = c(0, 12))

# Reset the plot window to default
par(mfrow = c(1, 1))
