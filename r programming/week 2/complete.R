library(stringr)

readMonitorData <- function( filename ) {
  
  # read in the data
  data <- read.csv( filename, 
                    header = TRUE )
  
  return( data )
}

complete <- function(directory, id = 1:332){
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