##
setwd("C:/R/dev/apps/danboard/")
#SPSS用フォーマット
#有効データの抽出
(dur)
(cou)
(ttf)

SPSSTABLE<-function(AOIDATA, METRICSNAME){
  library(reshape2) #melt関数を使用する
  
  mtcs <- AOIDATA
  mtcs$ID2 <- t(attlist["att01",att$att01+2])
  
  #主キーを"ID2"とする
  #ID2:DataCollect時に使用する被験者番号となる
  mm <- melt(mtcs, id=c("ID2"))
  mm$Metrics <- METRICSNAME
  
  name1 <- aoilist[mm$variable,]$name1
  name2 <- aoilist[mm$variable,]$name2
  
  mm$AOI_name <- paste(name1,name2,sep="")
  print(head(mm))
  print(dim(mm))
  return(mm)
}
spssdur<-SPSSTABLE(dur, "VD")
spsscou<-SPSSTABLE(cou, "VC")
spssttf<-SPSSTABLE(ttf, "TTF")

comb<-rbind(spssdur,spsscou,spssttf)
head(comb)
dim(comb)
str(comb)

a<-data.frame(ID=comb$ID2, AOI_name=comb$AOI_name, AOI_R=comb$variable, Metrics=comb$Metrics, quantity=comb$value)
b<-a[order(a$att01),]