## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## inline comments
makeCacheMatrix <- function(x = matrix()) {

  ##initliase environment scope variabe.
  inversed <- NULL
  
  ## explicit data on set and nullify environment variable.
  set <- function(k){
    inversed <<- NULL
    x <<- k 
    ## re-initialise x matrix 
  }
  
  ## return matrix
  get <- function() x
  
  ## store inversed matrix m in inversed env variable.  
  setInversedMatrix <- function(m) inversed <<- m
  
  ## return inversed variable. 
  getInversedMatrix <- function() inversed
  
  ## overrite list and return members. 
  list(set = set, get = get, setInversedMatrix = setInversedMatrix, getInversedMatrix = getInversedMatrix)
}


## Write a short comment describing this function
## inline comments
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  
  ## load previously inversed matrix, returns null if doesn't exist
  inversed <- x$getInversedMatrix()
  
  ## inversed exist?
  if(!is.null(inversed)){
    return(inversed)
  }
  
  ## read data 
  data <- x$get()
  
  ## This generic function solves the equation a %*% x = b for x, where b can be either a vector or a matrix.
  inversed <- solve(data)
  
  ## set the inversed matrix 
  x$setInversedMatrix(inversed)
  
  ##return inversed data
  inversed     
}




