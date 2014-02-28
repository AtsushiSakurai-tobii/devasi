setwd("C:/R/dev/apps/danboard/")
#SPSS用フォーマット
#str(durget)
#str(couget)
#str(ttfget)

SPSSTABLE <- function(){
  library("reshape2", lib.loc="C:/Users/asi/Documents/R/R-2.15.1/library")
  
  d.melt   <- melt(durget, id=rownames(durget))
  c.melt   <- melt(couget, id=rownames(couget))
  t.melt   <- melt(ttfget, id=rownames(ttfget))
  head(dct.melt<- data.frame(d.melt,c.melt,t.melt))
  head(
    dct.melt.df <- data.frame(
        Index    = rownames(dct.melt),
        TobiiNo  = as.vector(as.matrix(attlist[1,att[dct.melt.df$subs,"att01"]+2])),
        subs     = dct.melt$Var1,
        d.aoi    = dct.melt$Var2,
        c.aoi    = dct.melt$Var2.1,
        t.aoi    = dct.melt$Var2.2,
        Duration = dct.melt$value,
        Count    = dct.melt$value.1,
        TTF      = dct.melt$value.2,
        d.N      = ifelse(is.na(dct.melt$value), "",1),
        c.N      = ifelse(is.na(dct.melt$value.1), "",1),
        t.N      = ifelse(is.na(dct.melt$value.2), "",1)
    )
  )
    
  metricsinfo <- data.frame()
  for(i in 1:nrow(dct.melt.df)){
    metricsinfo <- rbind(metricsinfo, aoilist[dct.melt.df$d.aoi[i]==aoilist$duration,])
  }
  
  head(spss.table    <- cbind(dct.melt.df, metricsinfo))
  rownames(rmorimilk.spss) <- NULL
  return(spss.table)
}