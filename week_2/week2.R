# Week 2 Lab: Import Data into R

# ============================
# 1. Setting Up Your Workspace
# ============================
# - Check the current working directory to ensure it's correctly set.
getwd()
# - Set the working directory to the folder where your dataset is located.
# Click Session -> Set Working Directory -> Choose Directory

# - Explain why setting the working directory is important for data imports.
# Setting the working directory simplifies file paths by allowing you to reference files with just their names or relative paths.


# ============================
# 2. Importing Data
# ============================
# - Import a dataset from the working directory.
movie <- read.csv("movies2009.csv")
# - Import a dataset directly from a URL.
movie2 <- read.csv("http://users.stat.umn.edu/~parky/movies2009.csv")
# - Import a dataset by manually selecting the file.
movie3 <- read.csv(file.choose(), header = TRUE)
# - Confirm that the dataset has been imported successfully.
View(movie3)


# ============================
# 3. Exploring the Dataset
# ============================
# - Open the dataset in a table view to inspect its contents.
View(movie3)
# - List all variable names in the dataset.
names(movie3)
# - View the first and last few rows of the dataset.
head(movie3)
# - Check the number of rows and columns in the dataset.
tail(movie3)


# ============================
# 4. Understanding Variables
# ============================
# - Check the structure of the dataset to identify variable types.
str(movie3)
# - Access individual variables in the dataset using the `$` operator.
movie3$Budget
# - Explain what happens if you try to access a variable directly by name without specifying the dataset.


# ============================
# 5. Exploring Distributions
# ============================
# - Create a histogram to visualize the distribution of a numeric variable.
hist(movie3$Total.Gross)
# - Customize the histogram by adding a title and axis labels.
hist(movie3$Total.Gross, main = "Histogram of Total Gross", xlab = "in millions of USD")
# - Create a boxplot to explore the spread and outliers of a numeric variable.
boxplot(movie3$Total.Gross)
# - Adjust the y-axis limits in the boxplot.
boxplot(movie3$Total.Gross, main = "My Boxplot", ylim = c(0,300))


# ============================
# 6. Summary Statistics
# ============================
# - Calculate the mean, median, standard deviation, and range of a numeric variable.
mean(movie3$Total.Gross)
median(movie3$Total.Gross)
sd(movie3$Total.Gross)
# - Handle missing data when calculating the mean by removing missing values.
mean(movie3$Total.Gross, na.rm = TRUE)
# - Calculate the trimmed mean by removing the top and bottom 10% of the data.
mean(movie1$Total.Gross, trim=0.1)
# - Summarize the entire dataset to get an overview of all variables.
summary(movie3$Total.Gross)


# ============================
# 7. Additional Explorations
# ============================
# - Create a frequency table for a categorical variable.
table(movie$Rating)


# ============================
# 8. Variables in the Dataset
# ============================
# - Describe what each variable in the dataset represents:
#   - Total.Gross: Domestic total box office (in millions of USD).
#   - Opening: Box office during the opening weekend (in millions of USD).
#   - Screens: Number of screens played.
#   - RT: Rotten Tomatoes ratings.
#   - International: International box office (in millions of USD).
#   - DVD: Estimated sales from DVDs.
#   - Budget: Production budget (in millions of USD).
#   - Genre: Genre of the movie.
