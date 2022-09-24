library('tidyverse') # read_csv function

# load chosen dataset
my_data <- read_csv('example_datasets/heart.csv')

# import 'raport' function from data_to_md file 
source('data_to_md.R')

# create pdf output
raport(my_data)


