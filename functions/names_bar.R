# this function creates bar plots for each of the variable in the dataset

names_bar <- function(dane, n_bars=15){
  
  # choose variables for plotting 
  names_bar = c()
  for (i in 1:length(dane)){
    if(length(table(dane[,..i])) <= n_bars){
      names_bar <- append(names_bar, colnames(dane[,..i]))
    }
  }
  
  # plot 
  if(length(names_bar)<3){
    print("Too few columns")
  } else {
    ggplot(gather(dplyr::select(dane, names_bar)), aes(value)) + 
      geom_bar(fill="#464040") + facet_wrap(~key, scales = 'free', ncol=4) + 
      coord_flip() + theme(axis.title.x = element_blank(), axis.title.y = element_blank())
  }
}