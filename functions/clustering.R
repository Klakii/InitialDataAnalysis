# this shows the optimal number of clusters for the whole dataset, then performs MDS, reducing data to two 
# dimensions, and finally plots the output for two created clusters   

source('functions/dummy_cols.R')

clustering <- function(data){
  
    # initial clusters for whole dataset
    data_dummied = dummy_cols2(data)
    numeric_data = sapply(data_dummied, is.numeric)
    data_dummied_numerical = data_dummied[,..numeric_data]
    a1b = fviz_nbclust(data_dummied_numerical, diss=dist(data_dummied_numerical, method = "euclidean"), pam, method='wss') + ggtitle("pam")
    a2b = fviz_nbclust(data_dummied_numerical, diss=dist(data_dummied_numerical, method = "euclidean"), kmeans, method='wss') + ggtitle("kmeans")
    a3b = fviz_nbclust(data_dummied_numerical, diss=dist(data_dummied_numerical, method = "euclidean"), clara, method='wss') + ggtitle("clara")
    b1b = fviz_nbclust(data_dummied_numerical, diss=dist(data_dummied_numerical, method = "euclidean"), pam, method='s') + ggtitle("pam")
    b2b = fviz_nbclust(data_dummied_numerical, diss=dist(data_dummied_numerical, method = "euclidean"), kmeans, method='s') + ggtitle("kmeans")
    b3b = fviz_nbclust(data_dummied_numerical, diss=dist(data_dummied_numerical, method = "euclidean"), clara, method='s') + ggtitle("clara")
    grid.arrange(a1b,a2b,a3b,b1b,b2b,b3b, ncol=3, top = "Optimal number of clusters")
    
    # perform mds 
    mds <- data_dummied_numerical %>%
      dist(method = "euclidean") %>%          
      cmdscale() %>%
      as_tibble()
    colnames(mds) <- c("Dim.1", "Dim.2")
    
    c3c = fviz_nbclust(mds, kmeans, method='s')+ ggtitle("Kmeans")
    d3c = fviz_nbclust(mds, kmeans, method='wss')+ ggtitle("Kmeans")
    grid.arrange(c3c, d3c, top = "Optimal number of clusters for two dimensions")
    
    # optimal number of clusters for two-dimensional dataset
    k = as.numeric(as.character(c3c$data[with(c3c$data, order(-y)),] %>% head(1)[1]))
    
    # Plot MDS
    clust <- kmeans(mds, k)$cluster %>%
      as.factor()
    mds <- mds %>%
      mutate(groups = clust)
    ggscatter(mds, x = "Dim.1", y = "Dim.2", 
              label = as.numeric(rownames(data_dummied_numerical)),
              color = "groups",
              palette = "jco",
              size = 1, 
              ellipse = TRUE,
              ellipse.type = "convex",
              repel = TRUE)
}




