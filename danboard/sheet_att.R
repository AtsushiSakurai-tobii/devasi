#http://monge.tec.fukuoka-u.ac.jp/r_analysis/basic_data_frame05.html
#category

clip <- read.table("clipboard", header=TRUE )
head(clip)
str(clip)

#levels(clip$att05)
#clip$att05 <- unclass(clip$att05)
#str(clip)
#clip$att05 <- factor(clip$att05)
#(clip$att05)

#for
for(i in 1:ncol(clip)){
  t <- eval(parse(text=paste("clip$",colnames(clip[i]),sep="")))
  levels(t)
  t <- unclass(t)
  str(t)
  t <- factor(t)
}


library("plyr", lib.loc="C:/Users/asi/Documents/R/R-2.15.1/library")
levrb <- data.frame()
fac_t <- data.frame()
for(i in 1:ncol(clip)){
  #i<-2
  t <- eval(parse(text=paste("clip$",colnames(clip[i]),sep="")))
  lev <- data.frame(t(data.frame(levels(t))))
  if(nrow(levrb)==0){
    levrb<-data.frame(lev)
  }else{
    levrb<-rbind.fill(levrb,lev)
  }
     
  tuc <- unclass(t)
  str(tuc)
  tdf <- data.frame(factor(tuc))
  if(ncol(fac_t)==0){
    fac_t<-tdf
  }else{
    fac_t<-cbind(fac_t,tdf)
  }
}
export_attlist   <- paste("C:/R/dev/apps/datacheck/", projn, "/Export_", projn, "_AOIData_Attlist.csv" , sep="")
write.csv(levrb, file=export_attlist, append=T, quote=T, col.names=T)

export_attdata   <- paste("C:/R/dev/apps/datacheck/", projn, "/Export_", projn, "_AOIData_Attdata.csv" , sep="")
write.csv(fac_t, file=export_attdata, append=T, quote=T, col.names=T)