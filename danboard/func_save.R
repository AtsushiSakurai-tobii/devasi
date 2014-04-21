#保存用関数
#SAVE==1:check_aoidata_metrics.r

savefunc <- function (SAVE,SAVEFILE,FILENAME) {
  saveflg <- 0
  saveflg <- as.numeric(readline("Save 1:YES,0:NO>>Enter : "))
  
  #保存日
  saveday <- format(Sys.Date(), format="%y-%m-%d")
  
  if(SAVE==1){
    if(saveflg>0){
      #保存ディレクトリを作成する
      dir.create(paste("C:/R/dev/apps/datacheck/", projectname, "/", sep=""), showWarnings = TRUE)
      #保存ファイル名
      projc   <- paste("C:/R/dev/apps/datacheck/", projectname, "/", saveday, "_Export_", projectname, "_AOIData_Checked.csv" , sep="")
      #ファイルを保存する
      write.csv(SAVEFILE, file=projc, append=T, quote=T, col.names=T)
      print("save")
    }else{
      print("保存しませんでした")
    } 
  
  }else if(SAVE==2){
    
    if(saveflg>0){
      #保存ディレクトリを作成する
      dir.create(paste("C:/R/dev/apps/danboard/usr/out/", projectname, "/", sep=""), showWarnings = TRUE)
      #保存ファイル名
      projc   <- paste("C:/R/dev/apps/danboard/usr/out/", projectname, "/", saveday, "_Export_", projectname, "_SPSS.csv" , sep="")
      #ファイルを保存する
      write.csv(SAVEFILE, file=projc, append=T, quote=T, col.names=T, row.names=FALSE)
      print("save")
    }else{
      print("保存しませんでした")
    }
    
  }else if(SAVE==3){
    
    if(saveflg>0){
      
      export_attlist   <- paste("C:/R/dev/apps/datacheck/", projectname, "/", saveday, "_Generate_", projectname, FILENAME , sep="")
      write.csv(SAVEFILE, file=export_attlist, append=T, quote=T, col.names=T)
      
      print("save")
      
    }else{
      print("保存しませんでした")
    }
    
  }else if(SAVE==4){
    
    if(saveflg>0){
      
      export_attdata   <- paste("C:/R/dev/apps/datacheck/", projectname, "/", saveday, "_Generate_", projectname, FILENAME , sep="")
      write.csv(SAVEFILE, file=export_attdata, append=T, quote=T, col.names=T)
      
      print("save")
      
    }else{
      print("保存しませんでした")
    }
    
  }else{
    print("ERROR:func_save")
  }
}