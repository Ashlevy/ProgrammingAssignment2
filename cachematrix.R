##makeCacheMatrix creates special matrix that can cache its inverse

makeCacheMatrix <- function(x =matrix()){
  j <- NULL
  set <- function(y) {
    x <<- y
    j <<- NULL
  }
  get <- function()x
  setinverse <- function(inverse) j <<- inverse
  getinverse <- function() j
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


##cacheSolve computes inverse of the special matrix from makeCacheMatrix
##if inverse has been calculated, cacheSolve retrieves inverse from cache

cacheSolve <- function(x, ...){
  j <- x$getinverse()
  if(!is.null(j)){
    message("getting cached data")
    return(j)
  }
  data <- x$get()
  j <- solve(data)
  x$setinverse(j)
  j
}
