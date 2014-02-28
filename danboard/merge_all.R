merge.all <- function(...)
{
  n <- length(list(...))
  temp <- list(...)[[1]]
  for (i in 2:n) {
    temp <- merge(temp, list(...)[[i]], all=TRUE)
  }
  return(temp)
}