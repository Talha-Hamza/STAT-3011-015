# Week 3 Lab: Comparing Variables Using Plots

# Step 1. Import the text file data set using its URL and explore its variable
m_new <- read.delim("http://users.stat.umn.edu/~parky/movies2009new.txt")
# Step 2. 
# a) Use table( ) to construct a frequency table of Rating.
table(m_new$Rating)
# b) How many movies are PG? 
# 29
# c) How many are R? 
# 39
# d) How many movies are in total? 
# 129
# e) What proportion of them are PG-13? 
# 57/129

# Step 3. 
# a) Make a histogram of Budget using hist() with breaks = 15.
hist(m_new$Budget, breaks = 15)
# b) Construct a boxplot() to observe the overall distribution of the Budget. 
boxplot(m_new$Budget)
# c) What is the shape of the distribution? Are there any outliers? 
# Right skewed. Yes, there are outliers
# d) Which of the plots (histogram or boxplot) is easier to identify outliers? 
# boxplot

# Step 4.
# Use summary() and report the five-number summary of the overall budget.
summary(m_new$Budget) 

# Step 5. 
# a) Note that by default mean() and sd() command uses option na.rm=FALSE. (Check ?mean, ?sd) 
mean(m_new$Budget, na.rm = TRUE)
sd(m_new$Budget, na.rm = TRUE)
#If a variable contains any missing values, we have to use mean() command with na.rm=TRUE. 
#) This option removes all missing values to calculate mean and standard deviation.

# Step 6. 
# a) The budget for the movie Fast and Furious is 85 million dollars. 
# How many standard deviations is this movie's budget away from the mean? 
s <- sd(m_new$Budget, na.rm = TRUE)
xbar <- mean(m_new$Budget, na.rm = TRUE)
(85-xbar)/s
# b) Do you think the result is unusually large? 
# No, it is 0.5 std away

# Step 7. 
# a) Modify the following command to create a side-by-side boxplot of the Budget separated by Ratings. 
boxplot(m_new$Budget~m_new$Rating, xlab="Ratings", ylab= "In Million USD", main="Budget")
# b) Overall which Rating tends to have the highest budget? 
# PG
# c) Specify the name of the statistic


# Step 8. To compare review scores from Rotten Tomatoes and Metacritic, 
# construct a side-by-side boxplot of two quantitative variables. 
# State one similarity and one difference between the two distributions. 

