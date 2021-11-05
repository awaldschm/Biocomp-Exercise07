### Exercise 7 - Early days of R
### 11/05/2021

#remove the contents of my environment
rm(list=ls())

#Set my Working Directory to the one containing this week's assignment
setwd("C:/Users/Alexis Waldschmidt/IntroBioComp/Biocomp-Exercise07")

###Question 1: Write R code that replicates the functionality of the head 
#   function we used in bash. Your code should define a variable with the file 
#   to return lines from and a variable representing the number of lines to be
#   returned from the top of the indicated file. The selected file content 
#   should be printed to the terminal in R. Do not use the head function in R. 
#   Be sure you are using square bracket indexing to subset the tabular file.

#create a matrix with column names "V1-5" that I can use to test my code,
#   then save it as a tab delimited file and put it into an object
matrix <- matrix(1:100, ncol = 5, byrow = TRUE)
colnames(matrix) <- c(paste("V", 1:5))
write.table(x = matrix, file = "matrix.csv", 
            col.names = T, row.names = F, sep = "\t")
matrix <- read.table("matrix.csv", header = T, sep = "\t")

#save the number of lines that will be returned into an object (I chose to do  
#   the first nine rows (plus the header) because that is what the bash head 
#   command returned)
num_rows <- 1:9

#index the top 5 results of V2
matrix[num_rows,]


###Question 2:

##Load the data contained in the provided 'iris.csv' file
iris <- read.table("iris.csv", header = T, stringsAsFactors = F, sep = ",")


##print the last 2 rows in the last 2 columns to the R terminal
tail(iris[,4:5], n = 2)


##get the number of observations for each species included in the data set
#first, find all the unique species names
unique(iris$Species)

#then, find the number of observations for each of these species
num_setosa <- sum(iris$Species == "setosa")
num_versicolor <- sum(iris$Species == "versicolor")
num_virginica <- sum(iris$Species == "virginica") 


##get rows with Sepal.Width > 3.5
large_sepal_width <- iris[iris$Sepal.Width > 3.5,]


##write the data for the species setosa to a comma-delimited file names 
#   'setosa.csv'
#first, save the data for setosa into an object
setosa_species <- iris[iris$Species == "setosa",]

#then, write it into a comma-delimited file
write.table(x = setosa_species, file = "setosa.csv", 
            row.names = F, col.names = T, sep =",")


##calculate the mean, minimum, and maximum of Petal.Length for observations from 
#   virginica
#first, save the data for virginica into an object
virginica_species <- iris[iris$Species == "virginica",]

#then, calculate the mean, minimum, and maximum petal length respectively
mean(x = virginica_species$Petal.Length)
min(x = virginica_species$Petal.Length)
max(x= virginica_species$Petal.Length)
