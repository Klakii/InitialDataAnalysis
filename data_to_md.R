# this function renders the prepared markdown template and produces html output

raport <- function(data){

  # check needed libraries
  requiredPackages = c("data.table", "rmarkdown", "tidyverse", "ggplot2", "dplyr", "corrplot", "xtable", "knitr", "kableExtra", 
                       "Hmisc", "psych", "gridExtra", "tidyr", "broom", "AICcmodavg", "corrr", "ggpubr", "xtable", "grid", "cluster",
                       "flexclust", "factoextra", "NbClust")
  
  for(i in requiredPackages){
    for(i in requiredPackages){if(!require(i,character.only = TRUE)) install.packages(i)}
    for(i in requiredPackages){if(!require(i,character.only = TRUE)) library(i,character.only = TRUE) } 
  }
  
  library('data.table')
  library('rmarkdown')
  data <-data.table(data)
  
  # print message for large datasets
  if(nrow(data)>1000){
    print("Dataset consists of over 1000 rows, rendering might take a longer time!")
  }
  
  # render template
  render("template.Rmd", output_file = paste0('report_', '.html'))
  
  # open rendered html file
  system2("open", 'report_.html')
  
}
