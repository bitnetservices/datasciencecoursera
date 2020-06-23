library(stringr)

readMonitorData <- function( filename ) {
  
  # read in the data
  data <- read.csv( filename, 
                    header = TRUE )
  
  return( data )
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  means <- vector(length = length(id))
  for (i in id){
    f <- str_pad(i, 3, pad = "0")
    filename <- paste(f, ".csv", sep = '')
    monitorData <- readMonitorData(file.path(directory, filename))
    means[i] <- colMeans(monitorData[pollutant], na.rm = T)
  }
  mean(means, na.rm = T)
}
