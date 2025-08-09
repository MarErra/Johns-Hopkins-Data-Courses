## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    matrix_inverse<-NULL         ## Initialize variable to store cached inverse
    set_matrix<- function(y){    ## Function to set a new matrix
        x<<-y                    ## Save the new matrix in the parent environment
        matrix_inverse <<-NULL   ## Reset cached inverse because the matrix changed
    }
    get_matrix <- function()x                                             ## Function to get the current matrix
    set_matrix_inverse <-function(inversa) matrix_inverse <<- inversa     ## Function to store the inverse and save the inverse in the parent environment
    get_matrix_inverse <- function()matrix_inverse                        ## Function to get the cached inverse (if any)
    list(set_matrix=set_matrix,get_matrix=get_matrix, set_matrix_inverse=set_matrix_inverse, get_matrix_inverse = get_matrix_inverse )   ## Return a list of functions to interact with the matrix and its cached inverse
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    matrix_inverse <- x$get_matrix_inverse()   ## Retrieve cached inverse (if it exists)
    if(!is.null(matrix_inverse)) {             ## Check if an inverse is already cached
        message("getting cached data")         ## Display message to indicate cached data is used
        return(matrix_inverse)                 ## Return the cached inverse without recomputing
    }
    m <- x$get_matrix()                        ## Get the matrix from the object
    matrix_inverse <-solve(m)                  ## Do the inverse of the matrix
    x$set_matrix_inverse(matrix_inverse)       ## Cache the computed inverse
    matrix_inverse                             ## Return the newly computed inverse
}
