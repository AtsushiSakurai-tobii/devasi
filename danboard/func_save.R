#保存用関数
#SAVE==1:check_aoidata_metrics.r

savefunc <- function (SAVE,SAVEFILE) {
  saveflg <- 0
  saveflg <- as.numeric(readline("Save 1:YES,0:NO>>Enter : "))
  
  if(SAVE==1){
    if(saveflg>0){
      #保存ディレクトリを作成する
      dir.create(paste("C:/R/dev/apps/datacheck/", projn, "/", sep=""), showWarnings = TRUE)
      #保存ファイル名
      projc   <- paste("C:/R/dev/apps/datacheck/", projn, "/Export_", projn, "_AOIData_Checked.csv" , sep="")
      #ファイルを保存する
      write.csv(SAVEFILE, file=projc, append=T, quote=T, col.names=T)
      print("save")
    }else{
      print("保存しませんでした")
    } 
  
  }else if(SAVE==2){
    
    if(saveflg>0){
      #保存ディレクトリを作成する
      dir.create(paste("C:/R/dev/apps/danboard/usr/out/", projn, "/", sep=""), showWarnings = TRUE)
      #保存ファイル名
      projc   <- paste("C:/R/dev/apps/danboard/usr/out/", projn, "/Export_", projn, "_SPSS.csv" , sep="")
      #ファイルを保存する
      write.csv(SAVEFILE, file=projc, append=T, quote=T, col.names=T)
      print("save")
    }else{
      print("保存しませんでした")
    }
    
  }else{
    print("ERROR:func_save")
  }
}