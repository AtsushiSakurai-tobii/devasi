HistAndBoxplot <- function(x,MAINNAME) {
  #OBJECT <- durget
  if(max(x, na.rm=TRUE)>0){
    op<-par(mfrow = c(2,1))
    hist(x, col = "blue", breaks = 10, xlim = c(0, max(x, na.rm=TRUE)), main=MAINNAME )
    #hist(x, col = "blue", breaks = 10, xlim = c(0, max(eval(parse(text=OBJECT)), na.rm=TRUE)), main=MAINNAME )
    rug(x)
    boxplot(melt(x)$value, horizontal = TRUE, las = 0, ylim = range(c(0, max(x, na.rm=TRUE))))
    par(op)
  }
}