# this function produces plots with the number of missing values for each variable, attaching the proper 
# colour on the graph (the more missing values there are, the more reddish the bar becomes)

calc_missings <- function(data){
  
  # data preparation
  data <- data.table(data)
  const <- nrow(data) 

  # useful functions for calculations 
  calc_missings <- function(data){sum(is.na(data))}
  calc_perc <- function(data){round(sum(is.na(data))/const,2)}
  
  # gather calculated statistics 
  what_miss <- data.table(
    "name" = names(data),
    "miss" = lapply(data, calc_missings),
    "percent" = lapply(data, calc_perc)
  )
  
  # functions for plotting
  quality_fun<- function(data){ifelse(data<0.1, "Very good", ifelse(data<0.35, "Average", ifelse(data<0.65, "Bad", "Absolutely the worst")))}
  colors_fun<-function(data){ifelse(data<0.1, "#224914", ifelse(data<0.35, "#79C15F", ifelse(data<0.65, "#E27F7F", "red")))}
  
  quality <- lapply(what_miss$percent, quality_fun)
  colorss <- lapply(what_miss$percent, colors_fun)
  
  what_miss <- what_miss[,list(what_miss, quality, colorss)]
  
  # change names
  names(what_miss)[1]<- "name"
  names(what_miss)[2]<- "miss"
  names(what_miss)[3]<- "percent"

  # prepare plots 
  w<- ggplot(as.data.frame(what_miss), aes(x = name, y = unlist(percent), fill = colorss, label = as.numeric(percent))) +
      geom_bar(stat = "identity") +
      xlab("") + ylab("Percentage of missings")+
      coord_flip() + ggtitle("Percentage of missings")+theme_gray()+
      geom_label(label.size = 0.1) + ylim(0,1)+
      guides(fill=guide_legend(title="gg"))+theme(legend.position = 'right')
  

  q<- ggplot(as.data.frame(what_miss), aes(x = unlist(name), y = unlist(miss), fill = colorss, label = as.numeric(miss))) +
    geom_col(position = "dodge") +
    xlab("") + ylab("Number of missings")+
    coord_flip() + ggtitle("Number of missings")+theme_gray()+
    geom_label(label.size = 0.1) + theme(legend.position = 'right')
  
  grid.arrange(q,w, ncol=2)
  
}