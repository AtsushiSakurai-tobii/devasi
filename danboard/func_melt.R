FunctionMelt <- function(OBJECT){
  object.melt <- melt(as.matrix(OBJECT), id=rownames(OBJECT))
  return(object.melt)
}