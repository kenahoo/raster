\name{stackApply}

\docType{methods}

\alias{stackApply}

\title{Apply a function on subsets of a RasterStack or RasterBrick}

\description{
Apply a function on subsets of a RasterStack or RasterBrick. The layers to be combined are indicated with the vector \code{indices}. 
The function used should return a single value, and the number of layers in the output Raster* equals the number of unique values in \code{indices}.
For example, if you have a RasterStack with 6 layers, you can use \code{indices=c(1,1,1,2,2,2)} and \code{fun=sum}. This will return a RasterBrick with two layers. The first layer is the sum of the first three layers in the input RasterStack, and the second layer is the sum of the last three layers in the input RasterStack. See \code{\link{calc}} if you want to use a function that returns multiple layers based on _all_ layers in the Raster* object.
}

\usage{
stackApply(x, indices, fun, filename='', na.rm=TRUE, ...) 
}

\arguments{
  \item{x}{A Raster* object}
  \item{indices}{A vector of length \code{nlayers(x)} containing all integer values between 1 and the number of layers of the output Raster*}
  \item{fun}{A function that returns a single value, e.g. \code{mean} or \code{min}, and that takes an 'na.rm' argument}
  \item{na.rm}{Logical. If \code{TRUE}, \code{NA} cells are removed from calculations}
  \item{filename}{Character. Optional output filename}
  \item{...}{Additional arguments as for \code{\link{writeRaster}}}  

}

\value{
A new Raster* object, and in some cases the side effect of a new file on disk.
}

\seealso{\code{\link{calc}, \link{stackSelect}}}



\examples{
r <- raster(ncol=10, nrow=10)
r[]=1:ncell(r)
s <- brick(r,r,r,r,r,r)
s <- s * 1:6
b1 <- stackApply(s, indices=c(1,1,1,2,2,2), fun=sum)
b1
b2 <- stackApply(s, indices=c(1,2,3,1,2,3), fun=sum)
b2
}

\keyword{methods}
\keyword{spatial}

