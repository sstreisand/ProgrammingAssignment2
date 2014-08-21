## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#  if X is a square invertible matrix, then solve(X) returns its inverse
makeCacheMatrix <- function(x = matrix()) {
  # This function creates a special "matrix" object that can cache its inverse.
  # ix is the inverse of x - need to create it and cache it
  #ix <-solve(x)
  ix <- NULL
  set <- function(y) {
    x <<- y
    ix <<- NULL
  }
  get <- function() x
  setinv <- function(inv) ix <<- inv
  getinv <- function() ix
  list(set = set, get = get, setinv = setinv, getinv = getinv)

}


## Write a short comment describing this function
# this function calculates the inverse of the special matrix created with the above function
#However, it first checks to see if the inverse has already been calculated
# If so, it gets the inverse from the cache and skips the calculation
# Otherwise it calculates the inverse of the matrix and sets the value of the inverse via the setinv function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinv()
  if (!is.null(i)){
    message("getting cached inverse")
    return(i)
  }
# message("inverse is not cached")

 data<-x$get()
 message(data)
  i <- solve(data, ...)
  x$setinv(i)
  i
}
