## In this module it's provided a matrix cache solution to avoid recalculate the inverse of a matrix
## In case of the matrix inversion operation was already performed over cached matrix, the old result is immediatelly
## returned boosting the operation performance.

## As you can see cache matrix with get()/set() operations it's like an object as considered in  OO paradigm or
## an abstract data type

## This function creates a new matrix suitable to cache mechanism. The matrix provided as parameter
## is storaged in internal function environment and get()/set() properties operations are created as inner functions
## (it's like a method emulation). A matrix and its inverse form can be storaged to be retrieve from cacheSolve function later
makeCacheMatrix <- function(x = matrix()) {
	
	##Cache storage for inverse matrix result
	m <- NULL

	## Set operation to load a new matrix in cache. Previous inverse result is cleared
        set <- function(y) {
                x <<- y
                m <<- NULL
        }

	## Get operation to return the real matrix
        get <- function() x
		
	## Set operation to load inverse matrix result in cache
        setinverse <- function(inverse) m <<- inverse
	
	## Get operation to return the inverse matrix result from cache
        getinverse <- function() m

	## Matrix cache operation list
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## This function computes the inverse of x cached matrix in case it wasn't previously calculated.
## In case of the inversion operation was already performed on X, the previuos cached result is returned immediatelly with
## no extra overhead
cacheSolve <- function(x, ...) {

	## Trying to recover previuos inverse result from cache matrix
	m <- x$getinverse()
	if(!is.null(m)) {
		## Hit cache case. Returning previous result with no extra calculations	
              message("getting cached data")
              return(m)
      	}
      	
	## No result was found in matrix cache. Solving matrix and saving result in cache...
      	data <- x$get()
      	m <- solve(data, ...)
      	x$setinverse(m)

	##Returning the computed result
      	m
}
