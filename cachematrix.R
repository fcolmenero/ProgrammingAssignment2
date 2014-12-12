## In this module it's provided a matrix cache solution to avoid recalculate the inverse of a matrix
## In case of the matrix inversion operation was already performed over cached matrix, the old result is immediatelly
## returned boosting the operation performance.

## As you can see cache matrix with get()/set() operations it's like an object as considered in  OO paradigm or
## an abstract data type

## This function creates a new matrix suitable to cache mechanism. The matrix provided as parameter
## is storaged in internal function environment and get()/set() properties operations are created as inner functions
## (it's like a method emulation). A matrix and its inverse form can be storaged to be retrieve from cacheSolve function later
makeCacheMatrix <- function(x = matrix()) {

}

## This function computes the inverse of x cached matrix in case it wasn't previously calculated.
## In case of the inversion operation was already performed on X, the previuos cached result is returned immediatelly with
## no extra overhead
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
