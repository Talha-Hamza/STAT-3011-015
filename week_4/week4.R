# Read the tornado dataset from a CSV file
# replace text in quotation marks ("") replace with absolute path of the data stored in your PC
tor <- read.csv("C:/Users/Hamza/Downloads/tornadoes_new.csv") 

# Create a new column 'Sig' to mark significant tornadoes (Fuj >= 2)
tor$Sig <- ifelse(tor$Fuj >= 2, "Yes", "No")

# Display the count of significant tornadoes (Yes/No) and tornado areas
table(tor$Sig)
table(tor$Area)

# Create a contingency table of significant tornadoes by area
my_table <- table(tor$Sig, tor$Area)
# Definition: A contingency table displays frequencies for combinations of two categorical variables

my_table # display the contigency table

# Display row totals (Totals for Significance)
margin.table(my_table, 1)

# Display column totals (Totals for Area)
margin.table(my_table, 2)


# Question 1
# Let E denote the events that the tornado made the touchdown in East Central Minnesota and 
# and T denote that the tornado is a significant tornado.  Using the data above to estimate the probabilities Pr(E) and Pr(T).
# Solution: Pr(E) =number of E / total number of tornadoes =   127/1,363 = 0.093, 
# Pr(T) = number of significant / total  = 237/1,363 = 0.174.

# Question 2
# Estimate the probability that a Minnesota tornado made the touchdown in East Central Minnesota and was significant.
# Solution: Pr(E ∩ T) = 31/1,363 = 0.023

# Question 3
# Estimate the probability that a Minnesota tornado made the touchdown in East Central Minnesota or was significant (or both).
# Solution: Pr(E ∪ T) = Pr(E) + Pr(T) - Pr(E ∩ T) = 127/1,363 + 237/1,363 - 31/1,363 = 333/1,363 (count without double daunting) = 0.244

# Question 4
# Based on your answers from parts c. and d., are events E and T independent? Please use statistical reasoning and a formula to justify your answer.
# Solution: Since Pr(E) * Pr(T) = (127/1,363) * (237/1,363) = (0.093) * (0.174) = 0.016 ≠ 0.023 = Pr(E ∩ T), events E and T are NOT independent.

# Question 5
# Based on your answers from parts c. and d., are events E and T disjoint? Justify your response.
# Solution: Since Pr(E ∩ T) = 0.023 ≠ 0, events E and T are NOT disjoint.

# Question 6
# Estimate the probability that a Minnesota tornado was significant given that it had made the touchdown in East Central Minnesota. Comment on whether East Central Minnesota has a higher proportion of significant tornadoes compared to the whole state of Minnesota.
# Solution: The proportion of significant tornadoes in East Central Minnesota is Pr(T | E) = Pr(E ∩ T) / Pr(E) = (31 / 1,363) / (127 / 1,363) = 31/127 = 0.244. 
# Since this probability is greater than that of the whole state of Minnesota Pr(T) = 0.174, the tornadoes in East Central Minnesota are more likely to be significant compared to that of the whole Minnesota.

