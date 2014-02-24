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