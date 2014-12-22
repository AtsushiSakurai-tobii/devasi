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
      dir.create(paste("../datacheck/", projectname, "/", sep=""), showWarnings = TRUE,recursive= TRUE)#相対パス指定
      #保存ファイル名
      projc   <- paste(saveday, "_Export_", projectname, "_AOIData_Checked.csv" , sep="")
      #ファイルを保存する
      setwd(paste("../datacheck/",projectname,"/",sep=""))#作成した保存ディレクトリに移動
      write.csv(SAVEFILE, file=projc, append=T, quote=T, col.names=T)
      setwd("../danboard")#ディレクトリをdanboardに戻す
      print("save")
    }else{
      print("保存しませんでした")
    } 
  
  }else if(SAVE==2){
    
    if(saveflg>0){
      #保存ディレクトリを作成する
      dir.create(paste("./usr/out/", projectname, "/", sep=""), showWarnings = TRUE,recursive = TRUE)
      #保存ファイル名
      projc   <- paste(saveday, "_Export_", projectname, "_SPSS.csv" , sep="")
      #ファイルを保存する
      setwd(paste("./usr/out/",projectname,"/",sep=""))#作成した保存ディレクトリに移動
      write.csv(SAVEFILE, file=projc, append=T, quote=T, col.names=T, row.names=FALSE)
      setwd("../danboard")#ディレクトリをdanboradに戻す
      print("save")
    }else{
      print("保存しませんでした")
    }
    
  }else if(SAVE==3){
    
    if(saveflg>0){
      
      setwd("../datacheck")
      export_attlist   <- paste(projectname, "/", saveday, "_Generate_", projectname, FILENAME , sep="")
      write.csv(SAVEFILE, file=export_attlist, append=T, quote=T, col.names=T)
      setwd("../danboard")#ディレクトリdanboardに戻す
      print("save")
      
    }else{
      print("保存しませんでした")
    }
    
  }else if(SAVE==4){
    
    if(saveflg>0){
      setwd("../datacheck")
      export_attdata   <- paste(projectname, "/", saveday, "_Generate_", projectname, FILENAME , sep="")
      write.csv(SAVEFILE, file=export_attdata, append=T, quote=T, col.names=T)
      setwd("../danboard")#ディレクトリdanboardに戻す
      print("save")
      
    }else{
      print("保存しませんでした")
    }
    
  }else{
    print("ERROR:func_save")
  }
}