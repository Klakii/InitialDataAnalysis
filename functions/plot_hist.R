# this function creates bar plots for each of the variable in the dataset

plot_hist <- function(dane){
  
  numer <- is.numeric(dane)
  char <- is.character(dane)
  name <- colnames(dane)
  
  # check number of unique levels
  if (length(unique(dane))>50){
    print(kable("**  Too many levels! Histogram hard to read!  **"))
  }
  
  # plot histogram or bar plot 
  else{
    if(numer){
      ggplot(as.data.frame(dane), aes(x=dane)) + 
        geom_histogram(show.legend = FALSE, fill="#464040", bins=30) + ggtitle(paste0("Histogram", colnames(dane)))+ theme(axis.title.x = element_blank(),
                                                                                                                   axis.title.y = element_blank())
    }
    else{
      ggplot(data.frame(dane), aes(x=dane)) + 
        geom_bar(fill="#464040") + ggtitle(paste0("Bar")) + theme(axis.title.x = element_blank(), axis.title.y = element_blank())
    }
  }
}