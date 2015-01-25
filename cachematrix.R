## A pair of functions that cache the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  invMatr <- NULL
  get <- function() x
  setinvMatr <- function(im) invMatr <<- im
  getinvMatr <- function() invMatr
  list(get = get,setinvMatr = setinvMatr, getinvMatr=getinvMatr)
}


## This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix

cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
        invMatr <- x$getinvMatr()
        if(!is.null(invMatr)) {
                message("getting cached data")
                return(invMatr)}
        data <- x$get()
        invMatr <- solve(data)
        x$setinvMatr(invMatr)
        invMatr
}
