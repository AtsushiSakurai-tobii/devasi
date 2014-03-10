#SPSS用フォーマット
#str(durget)
#str(couget)
#str(ttfget)

SPSSTABLE <- function(){

  d.melt   <- melt(durget, id=rownames(durget))
  c.melt   <- melt(couget, id=rownames(couget))
  t.melt   <- melt(ttfget, id=rownames(ttfget))
  head(dct.melt<- data.frame(d.melt,c.melt,t.melt))
  head(
    dct.melt.df <- data.frame(
        TobiiNo  = as.vector(as.matrix(attlist[1,att[dct.melt$Var1,"att01"]+3])),
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
  attdata.table <- data.frame()
  meltdata.table <- data.frame()
  for(i in 1:nrow(dct.melt.df)){
    metricsinfo <- rbind(metricsinfo, aoilist[dct.melt.df$d.aoi[i]==aoilist$duration,])###
    
    #ATTDATA  <- attdata.df
    attdata.get   <- ATTDATA[dct.melt.df$TobiiNo[i],]
    attdata.table <- rbind(attdata.table, attdata.get)###
    
    #SELECTED <- (rec <- intev[,1:4])
    #meltする
    selected.melt <- melt(as.matrix(SELECTED), id=rownames(SELECTED))
    
    meltdata.get   <- selected.melt[c(PRO.SPSS$subs[i],PRO.SPSS$aoigroup1[i]),]
    meltdata.table <- rbind(meltdata.table, meltdata.get)###
  }
  
  head(spss.table    <- cbind(dct.melt.df, metricsinfo))
  rownames(spss.table) <- NULL
  return(spss.table)
}