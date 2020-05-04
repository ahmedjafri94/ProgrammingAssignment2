#makeCacheMatrix <- function(x= matrix()){
 # m<- NULL
 
  #set <- function(y) {
   # x<<- y 
  #m<<- NULL
#}
#get <- function()x

#setInverse <- function(inverse) m <<- inverse

#getInverse <- function() m 

#list(set = set , get = get,
 #    setInverse= setInverse,
  #   getInverse = getInverse)

#}#

#cacheSolve <- function(x)  {
  
#  m <- x$getInverse()
#  if (!is.null(m))
#    message("getting cached data")
#  return(m)
#}
#data <- x$get()  # Get value of matrix
#m <- solve(data) # Calculate inverse
#x$setInverse(m)  # Cache the result
#m                # Return the inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}