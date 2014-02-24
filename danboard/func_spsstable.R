setwd("C:/R/dev/apps/danboard/")
#SPSS用フォーマット
#有効データの抽出
#str(durget)
#str(couget)
#str(ttfget)

SPSSTABLE<-function(){
  
  ############ work ############
  (allmetrics   <- cbind(durget,couget,ttfget, all=TRUE))
  (metrics.df   <- data.frame(allmetrics))
  (surveyno     <- data.frame(t(attlist[1,1:nrow(metrics.df)+2])))
  (metrics.cb   <- cbind(metrics.df, ID = rownames(metrics.df), ID2 = surveyno))
  (metrics.melt <- melt(metrics.cb, id=c("ID","att01")))
  (metrics.merge<- merge(metrics.melt,aoilist,all=T))
  ############ work ############

  return(tbl)
}
