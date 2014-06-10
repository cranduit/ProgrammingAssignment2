## These functions store a matrix and the inverse of that matrix
## to save time on recalculating the inverse every time

## This function creates a "vector" or list containing functions
## that:
##   1. set the value of the matrix
##   2. get the value of the matrix
##   3. set the value of the inverse
##   4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    ## initilize the inverse to NULL
    inv <- NULL
    
    ## set the value of the matrix
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    ## get the value of the matrix
    get <- function() x
    
    ## solve the matrix to get the inverse and set the 
    ## value of the inverse
    setInv <- function(solve) inv <<- solve
    
    ## if the inverse exists, get the value of the inverse
    getInv <- function() inv
    
    ## list to initilize functions
    list(set = set, get = get,
         setInv = setInv,
         getInv = getInv)
}


## This function operates on a list of functions (made by
## running makeCacheMatrix() on a matrix) to either cache
## the inverse or read from the cached inverse

cacheSolve <- function(x, ...) {
    ## read the inverse from makeCacheMatrix
    inv <- x$getInv()
    
    ## if the inverse is not NULL (therefore exists) return
    ## cached value to the user
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    
    ## get the matrix value from makeCacheMatrix (was set 
    ## previously)
    data <- x$get()
    
    ## get the inverse of the matrix
    inv <- solve(data, ...)
    
    ## store the inverse in makeCacheMatrix
    x$setInv(inv)
    
    ## return the inverse
    inv
}
