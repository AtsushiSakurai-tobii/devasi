setwd("C:/R/dev/apps/danboard/")
#SPSS用フォーマット
#str(durget)
#str(couget)
#str(ttfget)

SPSSTABLE<-function(){
  
  ############ work ############
  d.melt   <- melt(durget, id=rownames(durget))
  c.melt   <- melt(couget, id=rownames(couget))
  t.melt   <- melt(ttfget, id=rownames(ttfget))
  dct.melt <- cbind(d.melt, c.melt[c("Var2","value")], t.melt[c("Var2","value")])
  
  (metrics.df <- dct.melt)
  (surveyno   <- data.frame(t(attlist[1,1:length(unique(metrics.df$Var1))+2])))
  (metrics.cb <- cbind(metrics.df, ID = rownames(metrics.df), surveyno))
  
  metricsinfo <- data.frame()
  for(i in 1:nrow(metrics.cb)){
    metricsinfo <- rbind(metricsinfo, aoilist[metrics.cb$Var2[i]==aoilist$duration,])
  }
  
  a<-cbind(metrics.cb,metricsinfo)
  
  projmelt   <- paste("C:/R/dev/apps/datacheck/", projn, "/Export_", projn, "_Melt_ver1.1.csv" , sep="")
  write.csv(a, file=projmelt, append=T, quote=T, col.names=T)
  ############ work ############

  return(tbl)
}
melt(couget, id=rownames(couget))