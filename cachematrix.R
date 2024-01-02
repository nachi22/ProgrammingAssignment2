## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#set(y)- Takes an argument 'y', sets the global variable 'x' to 'y', and 'j' to NULL.
#get()- Returns the value of the global variable 'x'.
#setInverse()- Takes an argument 'inverse' and sets the global variable 'j' to 'inverse'.
#getInverse()- Returns the value of the global variable 'j'.
# The code initializes a global variable 'j' to NULL. It creates a list of these functions and returns it.
makeCacheMatrix <- function(x = matrix()) {
  j <- NULL
  set <- function(y){
    x <<- y
    j <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) j <<- inverse
  getInverse <- function() j 
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}


## Write a short comment describing this function


#The code checks if there is cached data ('j') using the getInverse method. If found, we return the cached data. 
#If not, it retrieves a matrix 'mat' using the get method, calculates the inverse 'j' of the matrix, 
#and stores it in the cache using the setInverse method.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  j <- x$getInverse()
  if(!is.null(j)){
    message("getting cached data")
    return(j)
  }
  mat <- x$get()
  j <- solve(mat,...)
  x$setInverse(j)
  
}
