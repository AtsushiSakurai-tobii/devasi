setwd("C:/R/dev/apps/danboard/")
#SPSS用フォーマット
#有効データの抽出
#str(durget)
#str(couget)
#str(ttfget)

SPSSTABLE<-function(){
  
  ############ work ############
  #allmetrics <- cbind(durget, couget, ttfget, all=TRUE))
  d.melt   <- melt(durget, id=rownames(durget))
  c.melt   <- melt(couget, id=rownames(couget))
  t.melt   <- melt(ttfget, id=rownames(ttfget))
  dct.melt <- cbind(d.melt, c.melt[c("Var2","value")], t.melt[c("Var2","value")])
  
  #(metrics.df   <- data.frame(durget))
  (metrics.df <- dct.melt)
  (surveyno   <- data.frame(t(attlist[1,1:length(unique(metrics.df$Var1))+2])))
  (metrics.cb <- cbind(metrics.df, ID = rownames(metrics.df), surveyno))
  
  #metrics.xx  <- metrics.cb
  metricsinfo <- data.frame()
  for(i in 1:nrow(metrics.cb)){
    #i <- 1
    metricsinfo <- rbind(metricsinfo, aoilist[metrics.cb$Var2[i]==aoilist$duration,])
    #metrics.xx  <- merge(metrics.xx, aoilist[metrics.cb$Var2[i]==aoilist$duration,])
  }
  
  a<-cbind(metrics.cb,metricsinfo)
  #(metrics.melt <- melt(metrics.cb, id=c("ID","att01")))
  #(metrics.merge<- merge(metrics.melt,aoilist,all=T))
  #(metrics.merge<- merge(metrics.cb, aoilist, all=T))
  #View(metrics.merge)
  projmelt   <- paste("C:/R/dev/apps/datacheck/", projn, "/Export_", projn, "_Melt_ver1.1.csv" , sep="")
  write.csv(a, file=projmelt, append=T, quote=T, col.names=T)
  ############ work ############

  return(tbl)
}
melt(couget, id=rownames(couget))