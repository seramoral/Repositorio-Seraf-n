## This function creates a list containing functions to

##    set the value of the matrix
##    get the value of the matrix
##    set the value of the inverse
##    get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
	matriz_inversa <- NULL
	set <- function(y) {
                x <<- y
                matriz_inversa <<- NULL
      }
	get <- function() x
	setinversa <- function(inversa) matriz_inversa <<- inversa
      getinversa <- function() matriz_inversa
	list(set = set, get = get,
             setinversa = setinversa,
             getinversa = getinversa)
}

## This function returns the inverse of a matrix. Firstly, it checks if the matrix inverse has already been calculated and storaged in cache. 
## In afirmative case return straightforward the inverse matrix and if not the function calculates the matriz inverse and returns it

cacheSolve <- function(x, ...) {
	matriz_inversa <- x$getinversa()
	if(!is.null(matriz_inversa)) {
                message("Obteniendo la matriz inversa cacheada")
                return(m)
       }
	data <- x$get()
      matriz_inversa <- solve(data)
      x$setinversa(matriz_inversa)
      matriz_inversa

}
