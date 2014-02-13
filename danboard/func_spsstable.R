setwd("C:/R/dev/apps/danboard/")
#SPSS用フォーマット
#有効データの抽出
str(durget)
str(couget)
str(ttfget)

SPSSTABLE<-function(AOIDATA, METRICSNAME, AOIMTX){
  #AOIDATA    <-durget
  #METRICSNAME<-"VD"
  #AOIMTX     <-"duration"
  
  mtcss <- data.frame(AOIDATA)
  attid <- data.frame(t(attlist[1,att$att01+2]))
  colnames(attid) <- "ID2"
  mtcs  <- cbind(mtcss, ID=rownames(mtcss), attid)
    
  #主キーを"ID"とする
  #ID:DataCollect時に使用する被験者番号となる
  mm <- melt(mtcs, id=c("ID","ID2"))
  mm$Metrics <- METRICSNAME
  
  ############ work ############
  AOI_name <- c()
  for(i in 1:nrow(mm)){
    #i<-3528
    #name1sb <- subset(aoilist, aoilist$duration==as.matrix(mm$variable)[i])$name1
    #name2sb <- subset(aoilist, aoilist$duration==as.matrix(mm$variable)[i])$name2
    if(AOIMTX=="duration"){
      name1sb <- subset(aoilist, aoilist$duration==as.matrix(mm$variable)[i])$name1
      name2sb <- subset(aoilist, aoilist$duration==as.matrix(mm$variable)[i])$name2
    }
    if(AOIMTX=="count"){
      name1sb <- subset(aoilist, aoilist$count==as.matrix(mm$variable)[i])$name1
      name2sb <- subset(aoilist, aoilist$count==as.matrix(mm$variable)[i])$name2
    }
    if(AOIMTX=="ttf"){
      name1sb <- subset(aoilist, aoilist$ttf==as.matrix(mm$variable)[i])$name1
      name2sb <- subset(aoilist, aoilist$ttf==as.matrix(mm$variable)[i])$name2
    }
    AOI_name[i] <- paste(name1sb, name2sb, sep="")
  }
  ############ work ############

  print(length(AOI_name))
  print(dim(mm))
  tbl <- cbind(mm, AOI_name)
  print(dim(tbl))
  print(head(tbl))
  print(tail(tbl))
  return(tbl)
}
library(reshape2) #melt関数を使用する
spssdur<-SPSSTABLE(durget, "VD",  "duration")
spsscou<-SPSSTABLE(couget, "VC",  "count")
spssttf<-SPSSTABLE(ttfget, "TTF", "ttf")

comb<-rbind(spssdur,spsscou,spssttf)
spss.ds <- data.frame(ID=comb$ID, ID2=comb$ID2, AOI_name=comb$AOI_name, AOI_RMetrics=comb$variable, Metrics=comb$Metrics, quantity=comb$value)
spss.ds.ord <- spss.ds[order(spss.ds$ID,spss.ds$AOI_name),]
rownames(spss.ds.ord) <- NULL

#SPSS仕様
#quantity:NA->""とする
q<-ifelse(spss.ds.ord, is.na(spss.ds.ord$quantity), "", spss.ds.ord$quantity)


#savefunc("保存フラグ","保存するDataSet")
savefunc(2,spss.ds.ord)