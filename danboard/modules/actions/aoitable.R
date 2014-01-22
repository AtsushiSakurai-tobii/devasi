#setwd("C:/R/apps/danboard/modules/actions")
##抽出用for文
#ver1
#List<- data.frame()
#
#for(i in 1:nrow(List.Sp1.Far)){
#List.sb <- subset(ttf, select = paste("t.", Ner.Stp1$aoino[i], sep=""))
#List    <- rbind(List, t(List.sb))
#}

#ver2
#Function: aoidf
# x  :変数
# mc :ETメトリクス
# mn :1文字目(ttf/duration/count)+"."
#aoidf <- function(x, mc, mn){
#  
#  List<- data.frame()
#  
#  for(i in 1:nrow(x)){
#    List.sb <- subset(mc, select = paste(mn, x$aoino[i], sep=""))
#    List    <- rbind(List, t(sapply(List.sb, as.character)))
#  }
#  
#  return(t(List))
#  
#}
#
#文字型のデータに数値型などのデータをアペンドすると"不正な因子水準です"という警告がでる為、
#sapply関数にて文字列に変換する

#ver3
#Function: aoidf
# x  :変数
# mc :ETメトリクス
# mn :1文字目(ttf/duration/count)+"."
#aoidf <- function(x, mc, mn){
#
#  x.no <- unique(x$no)
#  for(i in 1:length(x.no)){
#    
#    (aoi.no.data <- x[x$no == x.no[i], ])
#    List<- data.frame()
#    
#    for(j in 1:nrow(aoi.no.data)){
#      List.sb <- subset(mc, select = paste(mn, aoi.no.data$aoino[j], sep=""))
#      colnames(List.sb) <- aoi.no.data$name[j]
#      List    <- rbind(List, t(sapply(List.sb, as.character)))
#    }
#    
#    colnames(List) <- att[att$NA. == mc$subs, ]$att01
#
#    #output filename : exp) 01_FAR_Step1.csv
#    filename <- paste("C:/R/project/Templates/work/jrer/output/ver3/", mn, aoi.no.data$no[j], "_", aoi.no.data$distance[j], "_", aoi.no.data$step[j], ".csv", sep="")
#    write.csv(t(List), file = filename, append=T, quote=T, col.names=T)
#
#  }
#  return(t(List))
#}
#

#ver4
#Function: aoidf
# VAR  :変数
# MET :ETメトリクス
# CA1 :1文字目(ttf/duration/count)+"."
aoidf <- function(VAR, MET, CA1){

  #i  <-1
  #VAR<-Far.Stp1
  #MET<-ttf
  #CA1<-"t."

  Lst.no <- unique(VAR$no)
  aoi_ds <- data.frame()
  for(i in 1:length(List.no)){
        
    #cleaning(aoi data)
    aoi_no <- VAR[VAR$no==List.no[i],]$aoino
    aoi_ds <- data.frame(MET[, paste(CA1, aoi_no, sep="")])

    #character to numeric
    if(ncol(aoi_ds) >1){
      aoi_ds <- data.matrix(aoi_ds)
    }else{
      aoi_ds[aoi_ds=="-"] <- NA
      aoi_ds <- data.frame(as.numeric(as.character(aoi_ds[,ncol(aoi_ds)])))
    }
    (aoi_ds)
    
    rownames(aoi_ds) <- att$att01
    colnames(aoi_ds) <- VAR[VAR$no==List.no[i],]$name
    
    #cleaning(save data)
    #output filename : exp) 01_FAR_Step1.csv
    filepath <- "C:/R/apps/danboard/modules/usr/out/JRER/"
    filename <- paste(filepath, CA1, List.no[i], "_", unique(VAR[VAR$no==List.no[i],]$distance), "_", unique(VAR[VAR$no==List.no[i],]$step), ".csv", sep="")
    write.csv(aoi_ds, file = filename, append=T, quote=T, col.names=T)
    
    
    ##Mean()
    #aoiAvg(aoi_ds, filepath)
    aoi_df <- data.frame(t(aoi_ds))
    aoi_df$Mean_all <- apply(aoi_df, 1, mean, na.rm=TRUE)
    
    men <- subset(att, att$att02==1)
    wom <- subset(att, att$att02==2)
    men.list <- aoi_df[ , men$att01]
    wom.list <- aoi_df[ , wom$att01]
    aoi_df$Mean_men <- apply(men.list, 1, mean, na.rm=TRUE)
    aoi_df$Mean_wom <- apply(wom.list, 1, mean, na.rm=TRUE)
    
    #if(CA1=="c."){
    #  aoi_df <- signif(aoi_df,1)
    #}else{
    #  aoi_df <- signif(aoi_df,3)
    #}
    
    fix_table <- rbind(aoi_df, Mood=as.character(att$att43))
    
    filename <- paste(filepath, CA1, List.no[i], "_", unique(VAR[VAR$no==List.no[i],]$distance), "_", unique(VAR[VAR$no==List.no[i],]$step), "_mean.csv", sep="")
    write.csv(fix_table, file = filename, append=T, quote=T, col.names=T)
    
  }
  #return(aoi_ds)
}
