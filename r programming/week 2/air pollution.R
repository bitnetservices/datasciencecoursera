library(stringr)

readMonitorData <- function( filename ) {
  
  # read in the data
  data <- read.csv( filename, 
                    header = TRUE )
  
  return( data )
}

pollutantmean1 <- function(directory, pollutant, id = 1:332) {
  means <- vector(length = length(id))
  for (i in id){
    f <- str_pad(i, 3, pad = "0")
    filename <- paste(f, ".csv", sep = '')
    monitorData <- readMonitorData(file.path(directory, filename))
    means[i] <- colMeans(monitorData[pollutant], na.rm = T)
  }
  mean(means, na.rm = T)
}


pollutantmean <- function(directory, pollutant, id = 1:332) {
  directory <- "specdata"
  temp <- list.files(pattern = "*.csv")   
  vs <- numeric()
  
  for(i in id) {
    f <- str_pad(i, 3, pad = "0")
    filename <- paste(f, ".csv", sep = '')
    x <- readMonitorData(file.path(directory, filename))
    y <- x[[pollutant]]
    z <- y[!is.na(y)]
    vs <- c(vs,z)
  }
  mean(vs)
}

complete1 <- function(directory, id = 1:332){
  nobs <- matrix(nrow= length(id), ncol = 2)
  colnames(nobs) <- c("id", "nobs")
  row = 0
  for (i in id){
    row <- row + 1
    f <- str_pad(i, 3, pad = "0")
    filename <- paste(f, ".csv", sep = '')
    monitorData <- readMonitorData(file.path(directory, filename))
    nobs[row, "id"] <- i
    nobs[row, "nobs"] <- sum(complete.cases(monitorData))
  }
  nobs
}

complete <- function(directory, id = 1:332) {
  directory <- "specdata"
  temp <- list.files(pattern = "*.csv")   
  vs <- numeric()
  
  for(i in id) {
   
    f <- str_pad(i, 3, pad = "0")
    filename <- paste(f, ".csv", sep = '')
    x <- readMonitorData(file.path(directory, filename))
    good <- complete.cases(x[["sulfate"]],x[["nitrate"]])
    vs <- c(vs,nrow(x[good,]))
  }
  
  dataframe <- data.frame(id=id, nobs = vs)
  print(dataframe)
}

corr <- function(directory, threshold = 0) {
  directory <- "specdata"
  temp <- list.files(pattern = "*.csv")   
  vs <- numeric()
  
  for(i in 1:332) {
    f <- str_pad(i, 3, pad = "0")
    filename <- paste(f, ".csv", sep = '')
    x <- readMonitorData(file.path(directory, filename))
    good <- complete.cases(x[["sulfate"]],x[["nitrate"]])
    k <- nrow(x[good,])
    if (k > threshold) {
      result <- cor(x[good,2],x[good,3]) 
      vs <- c(vs,result)
    } else {
      result <- 0  ##note here is result, not vs <-0.
    }
  }
  return(vs)
}