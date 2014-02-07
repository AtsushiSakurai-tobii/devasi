#Function:AOITABLE
#SUBSET:条件によりサブセットしたAOIデータ
#METRIX:ETメトリクス
#METDOT:ETメトリクスの頭文字
AOITABLE <- function(SUBSET, METRIX, METDOT){
  
  #i  <-17
  #SUBSET <-Far.Stp1
  #METRIX <-ttf
  #METDOT <-"t."

  List.no <- unique(SUBSET$no)
  aoi_ds <- data.frame()
  #for(i in 1:length(List.no)){
  for(i in 16:18){
    
  
    #cleaning(aoi data)
    aoi_no <- SUBSET[SUBSET$no==List.no[i],]$aoino
    aoi_ds <- data.frame(METRIX[, paste(METDOT, aoi_no, sep="")])
    
    #character to numeric
    if(ncol(aoi_ds) >1){
      #AOIデータが複数列の場合:data.matrixでまとめてデータ構造を変換する。
      aoi_ds <- data.matrix(aoi_ds)
    }else{
      #AOIデータが単数列の場合:"NA"に変換しDFをつくる。
      aoi_ds[aoi_ds=="-"] <- NA
      aoi_ds <- data.frame(as.numeric(as.character(aoi_ds[,ncol(aoi_ds)])))
    }
    (aoi_ds)
    
    rownames(aoi_ds) <- att$att01 　　　　　　　　　　　　　　#T-ID を行名にする。
    colnames(aoi_ds) <- SUBSET[SUBSET$no==List.no[i],]$name　 #AOI名を列名にする。
    
    #cleaning(save data)
    #output filename : exp) 01_FAR_Step1.csv
    filepath <- paste("C:/R/dev/apps/danboard/usr/out/", projn, "/", sep="")
    filename <- paste(filepath, METDOT, List.no[i], "_", unique(SUBSET[SUBSET$no==List.no[i],]$distance), "_", unique(SUBSET[SUBSET$no==List.no[i],]$step), ".csv", sep="")
    write.csv(aoi_ds, file = filename, append=T, quote=T, col.names=T)  
    
    ##PlotFunction()
    AOIPLOT(aoi_ds)
    
  }
  
  #return(aoi_ds)
}