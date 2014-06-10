mat1<-matrix(c(1,1,1,3,4,3,3,3,4),3,3)
e<-makeCacheMatrix(mat1)
f<-cacheSolve(e)
solve(mat1)
f
