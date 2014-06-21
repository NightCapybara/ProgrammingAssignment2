## Put comments here that give an overall description of what your
## functions do

## Makes an object, with a list of functions to get, set, store the 
## inverted matrix in m variable.

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverted <- function(inverted) m <<- inverted
        getinverted <- function() m
        list(set = set, get = get,
             setinverted = setinverted,
             getinverted = getinverted)
}


## Check if the object has inverted matrix stored in it,if not, compute inv and 
## store the value via setinverted()

cacheSolve <- function(x, ...) {
        
m <- x$getinverted()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverted(m)
        m
}

A = matrix( 
   c(2, 4, 3, 1, 5, 7, 1, 1, 1), 
   nrow=3,              
   ncol=3,               
   byrow = TRUE)        
 

B = makeCacheMatrix(A)
print(B$getinverted())
cacheSolve(B)
print(B$getinverted())
cacheSolve(B)