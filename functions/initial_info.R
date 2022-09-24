# this function produces initial information about the types of variables and missing values in the dataset

initial_info <- function(data){
  
  # preparation  
  data <- data.table(data)
  nrow(data) -> n_of_observations
  
  # set initial values
  n_binary = 0
  n_factors = 0
  n_continuous = 0
  n_character = 0
  
  # calculate the number of variables of each type
  for (i in 1:ncol(data)){
    
    if(is.numeric(data[[i]])){
      
      if(length(table(data[[i]])) <= 2){
        n_binary = n_binary + 1
      }
      
      if(length(table(data[[i]])) > 2 & length(table(data[[i]])) < 40){
        n_factors = n_factors + 1
      }
      
      if(length(table(data[[i]])) >= 40){
        n_continuous = n_continuous + 1
        
      }
    }
    
    if(!is.numeric(data[[i]])){
      if(typeof(data[[i]])=='character'){
        n_character = n_character + 1
      }
    }
  }
  
  # produce output
  print(kable(paste0("Number of variables: ", ncol(data))))
  print(kable(paste0("Number of observations: ", nrow(data))))
  print(kable(paste0("Number of missings: ", sum(is.na(data)))))
  print(kable(paste0("Percentage of missings: ", round(sum(is.na(data))/n_of_observations, 3))))
  print(kable(paste0("Number of duplicated rows: ", sum(duplicated(data)))))
  print(kable(paste0("Number of binary variables: ", n_binary)))
  print(kable(paste0("Number of factors variables: ", n_factors)))
  print(kable(paste0("Number of continuous variables: ", n_continuous)))
  print(kable(paste0("Number of character variables: ", n_character)))
}
