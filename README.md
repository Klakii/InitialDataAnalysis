# Initial Data Analysis Tool
Maciej Zdanowicz 
#
In the following project I have decided to create the tool for initial data analysis. The most popular 
tool like that widely available is the DataExplorer library, which, in my humble opinion, was 
not a very convenient tool to use nor did it suit my needs. 

My project consists of three main parts:
* folder called functions contains 6 functions used in our project; functions used for 
plotting histograms, performing PCA etc.,
* R-markdown file called template produces the html output,
* R file called data_to_md contains the raport function, which takes data provided by 
the user, renders the markdown template with this data, and creates final report.

How to use this tool?

The first thing needed is the dataset that user wants to analyse. Then, all he or she needs to do 
is to import the report function from the data_to_md file (f.e. by using: 
source('data_to_md.R')) and run it with chosen dataset as the argument (remember to change 
the directory to file’s location!). test_run file contains the example of how to use our function. 

What information does created output contain?
1. Initial data check, including first and last five rows of data, information about the 
types of variables, as well as their mean, standard deviation, median etc.
![image](https://user-images.githubusercontent.com/100470483/221408620-6b9b7771-3501-4f94-ae3c-75b49927ec56.png)
![image](https://user-images.githubusercontent.com/100470483/221408636-692df27d-0872-4daa-9461-ddf4cebb2c6c.png)
2.	Missing values, two plots displaying number and percentage of missing values for each of the variables. Plots change their colours according to following rule:
*	if the proportion of missing values is lower than 10%, the bar is dark green,
*	if the proportion of missing values is between 10% and 35%, the bar is light green,
*	if the proportion of missing values is between 35% and 65%, the bar is light pink,
*	and if the proportion of missing values is higher than 65%, the bar is red.
3. Individual observations, including clickable tabsets for each of the variables, containing information 
such as: minimum value, median and maximum value, histogram or bar plot, percentage of missing values, and 
the result of linear regression for numerical variables. 
![image](https://user-images.githubusercontent.com/100470483/221408685-02c13795-4b7e-426b-b995-cfa9647842a0.png)
4.	Histograms and bar plots, this section contains histograms and bar plots for all variables in the dataset.
![image](https://user-images.githubusercontent.com/100470483/221408702-b97d9acd-eed5-4caf-a917-ab25c03942d8.png) ![image](https://user-images.githubusercontent.com/100470483/221408706-1180405a-678a-426c-9ec8-407a870b2410.png)
5.	Correlations, three different correlation matrixes are calculated: Pearson’s, Kendall’s and Spearman’s.
![image](https://user-images.githubusercontent.com/100470483/221408716-7778d74a-c48f-46e3-bf14-00b7de99aca4.png)![image](https://user-images.githubusercontent.com/100470483/221408717-07973539-17c3-424b-8f62-c225d5a150e1.png)
6.	Principal Component Analysis (PCA), plots displaying the Total Within Sum of Square and the Average Silhouette 
width for three different algorithms: PAM, k-means, and clara. These plots are useful in deciding on optimal number 
of clusters. Additionally, there are two plots representing the similar characteristics as before for the whole dataset 
that has been transformed into two dimensions. Last two plots present the clusters obtained from the two-dimensional dataset. 
![image](https://user-images.githubusercontent.com/100470483/221408730-46e41340-6596-4ea7-bb25-03a832a63a40.png)
![image](https://user-images.githubusercontent.com/100470483/221408739-61346390-4f47-432c-8716-78247f239a94.png)![image](https://user-images.githubusercontent.com/100470483/221408741-06991bb3-2763-4baf-aa72-78356c81e2a2.png)


